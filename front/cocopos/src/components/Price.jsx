import React from "react";
import styled from "styled-components";

const OnePrice = styled.div`
  display: flex;
  flex-direction: row;
  font-size:20px;
`

const PricesSubject = styled.div`
  display: flex;
  width: 150px;
`
const Prices = styled.div`
  display: flex;
`
const Price=({subject,num})=>{
    return(


            <OnePrice>
                <PricesSubject>{subject}</PricesSubject>
                <Prices>{num}</Prices>
            </OnePrice>


    )
}

export default Price;