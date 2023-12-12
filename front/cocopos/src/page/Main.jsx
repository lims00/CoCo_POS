import React, {useState} from 'react';
import styled from "styled-components";

import {Link} from "react-router-dom";
import Sale from "./Sale";



const SaleLink = styled(Link)`

  font-size: 20px;
  text-decoration: none;
  text-line-through-color: black;
`

const SaleWrapper = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
  width: 500px;
  height: 400px;
  font-size: 25px;
  text-decoration: none;
  border-radius: 10px;
  border: 1px solid grey;

`
const Wrapper = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin: 50px;
`
const SmallBtn = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 200px;
  height: 100px;
  border-radius: 10px;
  border: 1px solid grey;
  margin-left: 30px;
  margin-top: 20px;

`

const SmallBtnWrapper = styled.div`
  display: flex;
  flex-direction: column;
`
const Promotion = styled.div`
  display: flex;
width:500px;
  border: 1px solid grey;
  font-size: 18px;
  justify-content: center;
  height: 40px;
  align-items: center;
`
const Detail=styled.div`
display: flex;
  height: 45px;
  align-items: center;
  margin-left:30px;
  margin-top:50px;
  justify-content: center;
  border: 1px solid grey;
  border-radius: 10px;

`
const Main = () => {
    const [searchValue, setSearchValue] = useState('');


    return (
        <Wrapper>
            <p style={{display:'flex',flexDirection:'column'}}>
                <SaleWrapper>
                    <SaleLink to='/item'>상품 구매</SaleLink>
                </SaleWrapper>
                <Promotion>블랙프라이데이 12/1~12/15</Promotion>
                <Promotion>vip 회원 대상 증정품 제공 행사중</Promotion></p>
            <SmallBtnWrapper>
                <SmallBtn><SaleLink to='/sale'>거래내역</SaleLink></SmallBtn>
                <SmallBtn><SaleLink to='/return'>반품 및 교환</SaleLink></SmallBtn>
                <SmallBtn><SaleLink to='/manage'>재고관리</SaleLink></SmallBtn>
                <Detail><SaleLink to='/'>자세히 보기</SaleLink></Detail>
            </SmallBtnWrapper>
        </Wrapper>

    )
}

export default Main;