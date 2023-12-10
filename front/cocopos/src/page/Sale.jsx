import React, {useState} from 'react';
import styled from "styled-components";

import {Link} from "react-router-dom";


const IdInput = styled.div`
  display: flex;

`
const SaleBtn = styled.button`
  width: 400px;
  height: 50px;
  margin-top: 30px;
  border-radius: 10px;
  border: 1px solid grey;
  background-color: white;
`
const SaleWrapper = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding-top: 100px;
  width: 500px;
  height: 400px;
  font-size: 25px;
  text-decoration: none;
  border-radius: 10px;
  border: 1px solid grey;

`
const Sale=()=>{

    const [searchValue, setSearchValue] = useState('');
    const handleChange = (e) => {
        setSearchValue(e.target.value)
        console.log(searchValue)
    }
    const handleSearch=()=>{

    }
    return(
<>
    <SaleWrapper>
        <IdInput>
            회원번호 입력
            {/*<SaleLink to='/sale'>상품</SaleLink>*/}
            <input defaultValue={searchValue} underline={{'border': '0'}} onChange={handleChange}
                   style={{marginLeft: '30px', 'outline': 'none', 'underline': 'false'}}/>
        </IdInput>
        <SaleBtn onClick={handleSearch}>
            상품 조회
        </SaleBtn>
    </SaleWrapper>

</>


    )
}

export default Sale;