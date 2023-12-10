import React from "react";
import styled from "styled-components";

const IdInput = styled.div`
  display: flex;
  height: 50px;
  width: 110px;
  justify-content: flex-start;
  align-items: center;
  font-size: 20px;

`

const ContentBox = styled.div`
  margin-left: 30px;
  padding-left: 10px;
  border: 1px solid grey;
  width: 300px;
  height: 30px;
`
const Wrapper=styled.div`
display: flex;
  flex-direction: row;
  align-items: center;

`
const CustomerInfoBox = ({title, content = "내용"}) => {
    return (
        <Wrapper>
            <IdInput>
                {title}
                {/*<SaleLink to='/sale'>상품</SaleLink>*/}

            </IdInput>
            <ContentBox>{content}</ContentBox>
        </Wrapper>
    )
}


export default CustomerInfoBox;
