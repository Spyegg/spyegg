import requests
from bs4 import BeautifulSoup
import pandas as pd
from html_table_parser import parser_functions as parser

# 웹 페이지의 URL 설정
sanji_url = 'https://www.ekapepia.com/priceStat/distrSanjiPriceEgg.do?menuId=menu100156&boardInfoNo='

# 웹 페이지 요청
response = requests.get(sanji_url)

# BeautifulSoup을 사용하여 HTML 파싱
soup = BeautifulSoup(response.text, 'html.parser')

# 데이터 추출
data = soup.find('table')

table = parser.make2d(data)
df = pd.DataFrame(data=table[1:],columns=table[0])
df.to_csv('sanji.csv')

