import streamlit as st
import datetime

st.title('Register')

# 아이디 작성 창 생성
id = st.text_input('ID', '')

# 비밀번호 작성 창 생성
password = st.text_input('Password', '')

st.markdown('')

# 나이 선택 슬라이더 생성
age = st.slider('How old are you?', 0, 100, 25)
st.write("I'm", age, 'years old')
st.markdown('')

# 직업 선택 박스 생성
job = st.selectbox('What is your job?', ['administrative position', 'specialized job','office job','service position','sales position','agriculture, forestry and fisheries Service','technical post','equipment, machinery, and assembly jobs', 'simple labor', 'soldier'])
st.markdown('')

# 취침 시간 설정
inbed_time =  st.time_input('When do you usually go to bed?', datetime.time(12,30))

# 기상 시간 설정
getup_time = st.time_input('When do you usually get up?', datetime.time(7, 30))

st.markdown('')

# 회원 등록
if st.button('Sign up'):
    st.write('Welcome to Lite Right!')
