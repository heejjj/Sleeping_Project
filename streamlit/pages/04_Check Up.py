import streamlit as st
import numpy as np

st.title("Check up")
st.markdown('')

# 수면 사이클 그래프 연동(예정)
st.header("Today's Sleep Cycle")
with st.container():
    st.bar_chart(np.random.randn(50, 3))

# 세 칼럼으로 레이아웃 구성
col1, col2, col3 = st.columns(3)

# 수면의 질 별점
with col1:
    sleep_quality = st.radio(
        "How was your sleep quality?",
        ('⭐⭐⭐⭐⭐', '⭐⭐⭐⭐', '⭐⭐⭐', '⭐⭐', '⭐'))

# 당일 기분 평가
with col2:
    feeling = st.radio(
        "How was your day?",
        ('😝pretty good', '😄good', '😐not bad', '😒bad', '😣terrible'))

# 당일 활동 및 특이사항 복수선택
with col3:
    options = st.multiselect(
        'What did you do today?',
        ['taking a nap', 'do some exercise', 'drinking coffe', 'drinking alcohol', 'taking medicines', 'smoking'])

