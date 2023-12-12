import TableForm from "../components/TableForm";
import React, {useState} from "react";
import styled from "styled-components";
import {Link} from "react-router-dom";
import AlertModal from "../components/AlertModal";


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
  width: 400px;
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


const ReturnPage = () => {
    const [askReturnOpen,setAskReturnOpen]=useState(false);
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
    },{
        Id: 1,
            date: '2023-12-25',
            total: 3000
    }];
    const headerKey = ['Id', 'date', 'total'];
    const handleReturn=()=>{
        setAskReturnOpen(true);
    }
    return (

        <>
            <AlertModal isOpen={askReturnOpen} content={"반품 하실 겁니까?"} click={setAskReturnOpen}/>

            <Wrapper>
                최근 거래 내역
                <TableForm header={header} headerKey={headerKey} items={item} selectable={true}/>
                <p style={{display: 'flex', flexDirection: 'row'}}>
                    <ReturnBtn onClick={handleReturn}>반품</ReturnBtn>
                    <BottomBtn><SaleLink to='/'>문의내역 조회</SaleLink></BottomBtn>
                </p>

            </Wrapper>
        </>
    )
}

export default ReturnPage