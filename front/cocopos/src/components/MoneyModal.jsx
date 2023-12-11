import React from "react";

import styled from "styled-components";

const Modal1 = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.35);
`
const Modal2 = styled.div`
  display: flex;
  flex-direction: column;
  position: absolute;
  border-radius: 10px;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 800px;
  max-width: 70%;
  height: 400px;
  overflow-y: auto;
  background-color: white;
  align-items: center;
  padding-top:40px;
`
const ModalContent = styled.div`
  display: flex;
  flex-direction: row;
  margin: 20px;
  
  width: 80%;
  display: flex;
  justify-content: center;
  overflow: auto;
  text-align: center;
  font-size: 20px;
`
const ModalBtn = styled.button`
  background-color: white;
  border: 1px solid #e36464;
  border-radius: 10px;
  height: 40px;
  width: 120px;
  padding: 3px;
  margin-top:70px;
  font-size: 20px;
  margin-bottom: 20px;
`



const Tittle=styled.div`
  display: flex;
  justify-content: center;
    margin-right: 20px;
  width: 100px;

`
const MoneyModal=({isOpen,click,setInput,total,inputMoney})=>{
    const returnMoney=inputMoney-total
    const CloseModal=()=>{
        click(false);
    }
    return(
        <div style={{'display': isOpen ? "block" : "none"}}>
            <Modal1/>
            <Modal2>
                <ModalContent><Tittle>총 금액</Tittle>{total}</ModalContent>
                <ModalContent><Tittle>받은 금액</Tittle>{inputMoney}</ModalContent>
                <ModalContent><Tittle>거스름돈</Tittle>{returnMoney}</ModalContent>
                <ModalBtn onClick={CloseModal}>입력 완료</ModalBtn>
            </Modal2>
        </div>)
}

export default MoneyModal;