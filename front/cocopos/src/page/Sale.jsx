import React, {useEffect, useState} from 'react';
import styled from "styled-components";

import {Link} from "react-router-dom";
import TableForm from "../components/TableForm";


const Wrapper = styled.div`
  margin-top: 70px;
  margin-right: 30px;
  margin-left: 30px;
  display: flex;
  flex-direction: column;
  align-items: center;
`
const BottomBtn = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  border: 1px solid grey;
  width: 200px;
  margin: 10px;
  height: 50px;
`
const ResetBtn = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  border: 1px solid grey;
  width: 100px;
  margin: 10px;
  height: 50px;
`
const Sale = () => {

    const [searchValue, setSearchValue] = useState('');
    const header = [
        {
            text: '주문 번호',
            value: 'Id'
        },
        {
            text: '거래일',
            value: 'date'
        },
        {
            text: '총 금액',
            value: 'total'
        }];
    const item = [{
        Id: 1,
        date: '2023-12-25',
        total: 3000
    }];
    const headerKey = ['Id', 'date', 'total'];

    const handleChange = (e) => {
        setSearchValue(e.target.value)
        console.log(searchValue)
    }
    const handleSearch = () => {

    }

//여기에 데이터 불러와야함

    return (
        <Wrapper>
            최근 거래 내역
            <TableForm header={header} headerKey={headerKey} items={item} />
            <p style={{display: 'flex', flexDirection: 'row'}}>
                <BottomBtn>영수증 출력</BottomBtn>
                <BottomBtn>통계 확인</BottomBtn>
                <ResetBtn>새로고침</ResetBtn>
            </p>

        </Wrapper>


    )
}

export default Sale;