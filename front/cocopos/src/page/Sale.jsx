import React, {useEffect, useState} from 'react';
import styled from "styled-components";

import {Link} from "react-router-dom";
import TableForm from "../components/TableForm";
import axios from "axios";


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
    const [items, setItems] = useState([]);
    const header = [
        {
            text: '주문 번호',
            value: 'orderId'
        },
        {
            text: '거래일',
            value: 'orderDate'
        },
        {
            text: '총 금액',
            value: 'totalAmount'
        },
        {
            text: '결제 금액',
            value: 'discountedTotalPrice'
        }];
    const item = [{
        Id: 1,
        date: '2023-12-25',
        total: 3000
    }];
    const headerKey = ['orderId', 'orderDate', 'totalAmount', 'discountedTotalPrice'];

    const handleChange = (e) => {
        setSearchValue(e.target.value)
        console.log(searchValue)
    }
    const handleSearch = () => {

    }
    useEffect(() => {
        axios({
            method: "GET",
            url: "http://localhost:8080/orders",
        }).then((r) => {
            console.log(r)
            let data = r.data;
            data.map((d) => {
                let temp = {
                    orderId: d.orderId,
                    orderDate: d.orderDate,
                    totalAmount: d.totalAmount,
                    discountedTotalPrice: d.discountedTotalPrice
                }
                let temp_item = items;
                temp_item.push(temp)
                setItems(temp_item)
            })

        }).catch((e) => {
            console.log(e.toString())
        });
    }, [])

//여기에 데이터 불러와야함

    return (
        <Wrapper>
            최근 거래 내역
            <TableForm header={header} headerKey={headerKey} items={items}/>
            <p style={{display: 'flex', flexDirection: 'row'}}>
                <BottomBtn>영수증 출력</BottomBtn>
                <BottomBtn>통계 확인</BottomBtn>
                <ResetBtn>새로고침</ResetBtn>
            </p>

        </Wrapper>


    )
}

export default Sale;