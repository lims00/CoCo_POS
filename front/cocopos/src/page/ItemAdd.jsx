import styled from "styled-components";
import React, {useState} from "react";
import Sale from "./Sale";
import AlertModal from "../components/AlertModal";
import CustomerInfoBox from "../components/CustomerInfoBox";
import TableForm from "../components/TableForm";
import Price from "../components/Price";
import {Link} from "react-router-dom";

const Wrapper = styled.div`
  margin-top: 70px;
  margin-right: 30px;
  margin-left: 30px;
  display: flex;
  flex-direction: column;
  align-items: center;
`

const IdInput = styled.div`
  display: flex;
  height: 50px;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  font-size: 20px;

`
const SaleBtn = styled.button`
  width: 120px;
  height: 35px;
  margin-left: 30px;
  border-radius: 10px;
  border: 1px solid grey;
  background-color: white;
  font-size: 18px;
`

const CustomerInfoWrapper = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-top: 20px;
  margin-left: 40px;

`
const Promotion = styled.div`
  border: 1px solid grey;
  width: 250px;
  height: 50px;
  font-size: 20px;
  padding: 10px;
  margin-bottom: 20px;
`
const PriceWrapper = styled.div`
  width: 250px;
  display: flex;
  flex-direction: column;
  font-size: 20px;
  border: 1px solid grey;
  padding: 10px

`


const ItemWrapper = styled.div`
  display: flex;

`

const PaymentWrapper = styled.div`
  display: flex;
  flex-direction: row;
`
const PaymentLink = styled(Link)`

  font-size: 20px;
  text-decoration: none;
  text-line-through-color: black;
`

const PaymentBtn = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100px;
  height: 100px;
  border-radius: 10px;
  border: 1px solid grey;
  margin-left: 30px;
  margin-top: 20px;

`
const ItemAdd = () => {

    const [searchItem, setSearchItem] = useState('');
    const [customerId, setCustomerId] = useState('');
    const [searchCnt, setSearchCnt] = useState('');
    const [modalOpen, setModalOpen] = useState(true);
    const handleItem = (e) => {
        setSearchItem(e.target.value)
        console.log(searchItem)
    }
    const handleCnt = (e) => {
        setSearchCnt(e.target.value)
        console.log(searchCnt)
    }
    const handleAdd = () => {

    }


    const headers =
        [
            {
                text: '상품 번호',
                value: 'Id'
            },
            {
                text: '상품명',
                value: 'name'
            }, {
            text: '수량',
            value: 'cnt'
        }, {
            text: '단가',
            value: 'cost'
        }, {
            text: '가격',
            value: 'totalCost'
        },
        ];
    const items = [
        {
            id: '1',
            name: '초코송이',
            cnt: '2',
            cost: '1000',
            totalCost: '2000'
        }, {
            id: '1',
            name: '초코송이',
            cnt: '2',
            cost: '1000',
            totalCost: '2000'
        }
    ]
    const headerKey = [
        'id', 'name', 'cnt', 'cost', 'totalCost'
    ]
    return (
        <Wrapper>
            <AlertModal isOpen={modalOpen} content={"회원 번호를 입력하세요."} setInput={setCustomerId} click={setModalOpen}/>
            <ItemWrapper>
                <p style={{display: 'flex', flexDirection: 'column'}}>
                    <IdInput>

                        상품 번호
                        {/*<SaleLink to='/sale'>상품</SaleLink>*/}
                        <input defaultValue={searchItem} underline={{'border': '0'}} onChange={handleItem}
                               style={{
                                   marginLeft: '30px',
                                   marginRight: '30px',
                                   'outline': 'none',
                                   width: '130px',
                                   height: '25px',
                                   'underline': 'false',
                                   fontSize: '20px'
                               }}/>
                        수량
                        <input defaultValue={searchCnt} underline={{'border': '0'}} onChange={handleCnt}
                               style={{
                                   marginLeft: '15px',
                                   'outline': 'none',
                                   width: '80px',
                                   height: '25px',
                                   'underline': 'false',
                                   fontSize: '20px'
                               }}/>

                        <SaleBtn onClick={handleAdd}>
                            상품 추가
                        </SaleBtn>
                    </IdInput>
                    <TableForm header={headers} items={items} headerKey={headerKey}/>
                    <CustomerInfoWrapper>
                        <CustomerInfoBox title={"회원 아이디"} content={customerId}/>
                        <CustomerInfoBox title={"할인 쿠폰"} content={customerId}/>
                        <CustomerInfoBox title={"멤버십"} content={customerId}/>
                    </CustomerInfoWrapper></p>

                <p style={{display: 'flex', flexDirection: 'column', fontSize: '25px', marginLeft: '10px'}}>프로모션 정보
                    <Promotion></Promotion>
                    가격 정보
                    <PriceWrapper>

                        <Price subject={'상품 가격'} num={1000}/>
                        <Price subject={'부과세(10%)'} num={1000}/>
                        <Price subject={'총 가격'} num={1000}/>
                    </PriceWrapper>
                    <PaymentWrapper>
                        < PaymentBtn><PaymentLink to='/sale'>카드 결제</PaymentLink></PaymentBtn>
                        < PaymentBtn><PaymentLink to='/sale'>현금 결제</PaymentLink></PaymentBtn>
                    </PaymentWrapper>
                </p>

            </ItemWrapper>

        </Wrapper>


    )
}


export default ItemAdd;