!pip install transformers

import datetime
import json
import urllib.parse
from bs4 import BeautifulSoup
from transformers import pipeline
import requests
from tqdm import tqdm
classifier = pipeline("zero-shot-classification", model="facebook/bart-large-mnli")

URL = "https://www.imsnsit.org/imsnsit/notifications.php"
r = requests.get(URL)
soup = BeautifulSoup(r.content, 'html5lib')

base_id = "appdRitLAN4zcN7TA"
table_name = "Table%201"
url = "https://api.airtable.com/v0/" + base_id + "/" + table_name + "?fields%5B%5D=Title&maxRecords=1&sort%5B0%5D%5Bfield%5D=Created&sort%5B0%5D%5Bdirection%5D=desc"
headers = {"Authorization" : "Bearer" + " keyqE3rMTU01V1rMl",
 "Content-Type" : "application/json"}
#params = {"maxRecords" : 1, "sort" : [{"field": "Date", "direction": "desc"}]}
response = requests.get(url, headers=headers)
airtable_response = response.json()
airtable_records = airtable_response['records']
try:
  last_record = airtable_records[0]['fields']['Title']
except:
  last_record = None


sequences = []
table = soup.findAll('a', attrs = {'title':'NOTICES / CIRCULARS'}) #get table from ims
candidate_labels1 = ['1 semester', '2 semester', '3 semester', '4 semester', '5 semester', '6 semester', '7 semester', '8 semester', 'b.tech', 'm.tech', 'bba', 'mba', 'bftech', 'Electronics Communications Instrumentation', 'Bio Tech', 'Computer Science', 'Mechanical Engineering', 'English', 'Mathematics', 'Civil', 'registration', 'rules', 'classroom codes', 'examinations', 'workshops', 'schedule', 'practical']

if last_record:
  for i in range(len(table)):
    if table[i].font.text == last_record:
      table = table[:i]
      break
table = table[::-1]
for row in tqdm(range(len(table)), desc="Working..."):
  #print("Row {} of {}".format(row+1, len(table)))
  row = table[row]
  sequence = row.font.text
  if sequence == last_record:
    print("Airtable already updated!")
    break
  date = row.parent
  date = date.parent
  date = date.findAll('td')
  for i in date:
    date = i.font.text.strip()
    break
  date_obj = datetime.datetime.strptime(date, '%d-%m-%Y')

  y1 = classifier(sequence, candidate_labels1, multi_label=True) #classify
  lbls = y1['labels'][:3]
  upload_data = {'Title': sequence,
                 'URL': "https://imsnsit.glitch.me/?url="+urllib.parse.quote(row['href']),
                 'Labels': lbls, #take top 5 labels
                 'Date': str(date_obj.date())
                 }
  upload_dict = {"records" : [{"fields" : upload_data}], 
               "typecast" : False}
  upload_json = json.dumps(upload_dict)
  response = requests.post(url, data=upload_json, headers=headers)
  sequences.append(sequence)
  print("\n" + response.json()['records'][0]['fields']['Title'])
  print('Labels:', lbls)
print("\nDone! View at https://nsut.glitch.me")
