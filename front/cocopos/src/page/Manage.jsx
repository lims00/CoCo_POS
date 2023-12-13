import TableForm from "../components/TableForm";
import React from "react";
import styled from "styled-components";
import {Link} from "react-router-dom";

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
  width: 160px;
  margin: 10px;
  height: 50px;
`
const ReturnBtn=styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  border: 1px solid grey;
  width: 160px;
  margin: 10px;
  height: 50px;
  font-size: 20px;
  background-color: white;
`
const SaleLink = styled(Link)`

  font-size: 20px;
  text-decoration: none;
  text-line-through-color: black;
`


const Manage=()=>{
    const header = [
        {
            text: '카테고리',
            value: 'category'
        },
        {
            text: '상품명',
            value: 'name'
        },
        {
            text: '가격',
            value: 'price'
        },
        {
            text: '재고수량',
            value: 'cnt'
        }];
    const item = [{
        category: '음료',
        name:'스타벅스 아메리카노',
        price:'3800',
        cnt:'30'
    },{
        category: '음료',
        name:'스타벅스 아메리카노',
        price:'3800',
        cnt:'30'
    }];


    const headerKey = ['category','name','price','cnt'];
    return(
        <>
            <Wrapper>
                재고 관리
                <TableForm header={header} headerKey={headerKey} items={item} selectable={true}/>
                <p style={{display: 'flex', flexDirection: 'row'}}>
                   
                </p>

            </Wrapper>
        </>
    )
}

export default Manage;