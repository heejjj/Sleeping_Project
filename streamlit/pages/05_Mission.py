import streamlit as st
import datetime
import numpy as np
import pandas as pd

st.title("Mission")
st.markdown('')

# 두 컬럼으로 레이아웃 구성
col1, col2 = st.columns([2,1])

# 오늘 날짜 선택
with col1:
    d = st.date_input(
        "When is Today",
        datetime.date(2023, 5, 28))
    st.write('Today is:', d)

# 기상 미션 체크박스
with col2:
    st.markdown("")
    st.checkbox('mission list1')
    st.checkbox('mission list2')
    st.checkbox('mission list3')

st.markdown('')

# 미션 도달률 그래프 연동(예정)
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['a', 'b', 'c'])

st.line_chart(chart_data)