import React, {useState} from 'react';
import styled from "styled-components";

import {Link} from "react-router-dom";
import Sale from "./Sale";


const SaleBtn = styled.button`
  width: 400px;
  height: 50px;
  margin-top: 30px;
  border-radius: 10px;
  border: 1px solid grey;
  background-color: white;
`
const SaleLink = styled(Link)`

  font-size: 20px;
  text-decoration: none;
  text-line-through-color: black;
`
const IdInput = styled.div`
  display: flex;

`
const SaleWrapper = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

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
const Main = () => {
    const [searchValue, setSearchValue] = useState('');
    const handleChange = (e) => {
        setSearchValue(e.target.value)
        console.log(searchValue)
    }
    const handleSearch = () => {

    }

    return (
        <Wrapper>
            <SaleWrapper>
                <SaleLink to='/item'>상품 구매</SaleLink>
            </SaleWrapper>
            <SmallBtnWrapper>
                <SmallBtn><SaleLink to='/sale'>거래내역</SaleLink></SmallBtn>
                <SmallBtn><SaleLink to='/return'>반품 및 교환</SaleLink></SmallBtn>
                <SmallBtn><SaleLink to='/manage'>재고관리</SaleLink></SmallBtn>
            </SmallBtnWrapper>
        </Wrapper>

    )
}

export default Main;