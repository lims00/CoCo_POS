import React, {useState} from "react";
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
  margin: 40px;
  
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

const ModalInput=styled.input`
height: 40px;
  margin-top:30px;
  font-size: 30px;
  width: 200px;
`
const InputModal=({isOpen,click,setInput,content,moneyResult=()=>{}})=>{
    //이거 모달 닫을 때 보내는 input값? 처럼 쓸 예정인데 걍 필요없는듯,,
    const [inputValue,setInputValue]=useState('')
    const CloseModal = () => {
        if (inputValue!==''){
            click(false);
            moneyResult(true);
        }
    }
    const handleChange=(e)=>{
        setInput(e.target.value)
        setInputValue(e.target.value)
    }

    return(
        <div style={{'display': isOpen ? "block" : "none"}}>
            <Modal1/>
            <Modal2>
                <ModalContent>{content}</ModalContent>
                <ModalInput onChange={handleChange}></ModalInput>
                <ModalBtn onClick={CloseModal}>입력 완료</ModalBtn>
            </Modal2>
        </div>)
}

export default InputModal;
