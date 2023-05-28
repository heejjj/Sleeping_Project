import streamlit as st

st.title('Login')

# 아이디 입력 창 생성
id = st.text_input('ID', 'danaka')

# 비밀번호 입력 창 생성
password = st.text_input('Password', '****')

# 로그인 기능
if st.button('Sign in'):
    st.write('Hello, ', id)