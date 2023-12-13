import styled from "styled-components";
import React, {useEffect, useState} from "react";
import Sale from "./Sale";
import InputModal from "../components/InputModal";
import CustomerInfoBox from "../components/CustomerInfoBox";
import TableForm from "../components/TableForm";
import Price from "../components/Price";
import {Link} from "react-router-dom";
import AlertModal from "../components/AlertModal";
import MoneyModal from "../components/MoneyModal";
import axios from "axios";

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
  width: 120px;
  height: 100px;
  border-radius: 10px;
  border: 1px solid grey;
  margin-left: 10px;
  margin-top: 0px;

`

const PurchaseBtn = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 250px;
  height: 100px;
  border-radius: 10px;
  border: 1px solid grey;
  margin-left: 10px;
  margin-top: 0px;
`
const ItemAdd = () => {

    const [searchItem, setSearchItem] = useState('');
    const [customerId, setCustomerId] = useState('');
    const [searchCnt, setSearchCnt] = useState('');
    const [modalOpen, setModalOpen] = useState(true);
    const [couponId, setCoupon] = useState('');
    const [cardPayOpen, setCardPayOpen] = useState(false);
    const [moneyPayOpen, setMoneyPayOpen] = useState(false);
    const [moneyPayResultOpen, setMoneyPayResultOpen] = useState(false);
    const [moneyInput, setMoneyInput] = useState('');
    const [paymentOpen, setPaymentOpen] = useState(false);
    const [customerInfo, setCustomerInfo] = useState('');
    const [addedItemSet, setAddedItemSet] = useState([]);
    const [finalTotalPrice, setFinalTotalPrice] = useState(0);
    const [canCoupon, setCanCoupon] = useState(false);
    const headers =
        [
            {
                text: '상품 번호',
                value: 'productId'
            },
            {
                text: '상품명',
                value: 'productName'
            }, {
            text: '수량',
            value: 'quantity'
        }, {
            text: '단가',
            value: 'unitPrice'
        }, {
            text: '가격',
            value: 'totalProductPrice'
        },
        ];
    const headerKey = [
        'productId', 'productName', 'quantity', 'unitPrice', 'totalProductPrice'
    ]
    const handleItem = (e) => {
        setSearchItem(e.target.value)
        console.log(searchItem)
    }
    const handleCnt = (e) => {
        setSearchCnt(e.target.value)
        console.log(searchCnt)
    }
    const handleAdd = () => {
        console.log(customerId, searchItem, searchCnt)
        const data = {
            customerId: Number(customerId),
            productId: Number(searchItem),
            quantity: Number(searchCnt)
        }
        axios({
            method: 'POST',
            url: 'http://localhost:8080/addtocart',
            data: data
        }).then((r) => {
            let temp_item_data = r.data
            let temp = {
                productId: temp_item_data.productId,
                productName: temp_item_data.productName,
                quantity: temp_item_data.quantity,
                unitPrice: temp_item_data.unitPrice,
                totalProductPrice: temp_item_data.totalProductPrice
            }
            let temp_item = addedItemSet
            temp_item.push(temp)
            setAddedItemSet(temp_item)
            console.log(addedItemSet)
            setFinalTotalPrice(temp_item_data.totalPrice)

        }).catch((e) => {
            console.log(e.toString())
        })

    }
    useEffect(() => {
    }, [addedItemSet])
    const handleCardPay = () => {
        setCardPayOpen(true);

    }

    const handleMoneyPay = () => {
        setMoneyPayOpen(true);
    }

    const handlePayment = () => {
        setPaymentOpen(true);
        setCanCoupon(true);
        //구매하기 axios 넣을 자리

    }

    useEffect(() => {
        if (customerId !== '') {
            console.log(customerId);
            axios({
                method: "GET",
                url: `http://localhost:8080/customercart/${customerId}`,

            }).then((response) => {
                console.log(response.data)
                setCustomerInfo(response.data)
            }).catch((e) => {
                console.log(e.toString())
            })
        }
    }, [customerId])

    const handleMemberShip = () => {
        console.log('멤버십 적용')
        let temp = Number(finalTotalPrice) * (1 - (Number(customerInfo.membershipLevel) * 5) / 100)
        setFinalTotalPrice(temp)
    }

    return (
        <Wrapper>
            <InputModal isOpen={modalOpen} content={"회원 번호를 입력하세요."} setInput={setCustomerId} click={setModalOpen}/>
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
                    <TableForm header={headers} items={addedItemSet} headerKey={headerKey}/>
                    <CustomerInfoWrapper>
                        <CustomerInfoBox title={"회원 이름"} content={customerInfo.customerName}/>
                        <CustomerInfoBox title={"할인 쿠폰"} content={couponId} handleChange={setFinalTotalPrice}
                                         inputBox={true} totalPrice={finalTotalPrice} view={canCoupon}/>
                        <CustomerInfoBox title={"멤버십 Level"} content={customerInfo.membershipLevel}/>
                        <p style={{border: '1px solid grey', padding: '10px'}}>
                            상품 구매 방법 안내
                            <br/>
                            1. 상품 번호와 수량 입력 후 상품 추가 버튼을 누르면 상품이 추가됩니다.
                            <br/>
                            2. 구매하기 버튼을 누르면, 할인 쿠폰을 적용할 수 있습니다.
                            <br/>
                            3. 멤버십 할인 적용 버튼을 누르면 멤버십 할인 적용할 수 있습니다.
                            <br/>
                            4. 구매하기 버튼 클릭시 카드 결제 또는 현금 결제 창이 나옵니다.
                        </p>
                    </CustomerInfoWrapper></p>

                <p style={{display: 'flex', flexDirection: 'column', fontSize: '25px', marginLeft: '10px'}}>
                    프로모션 정보
                    <Promotion>{customerInfo.promotionDesc}</Promotion>
                    가격 정보
                    <PriceWrapper>
                        <Price subject={'상품 가격'} num={Number(finalTotalPrice) * 0.9}/>
                        <Price subject={'부가세(10%)'} num={Number(finalTotalPrice) * 0.1}/>
                        <Price subject={'총 가격'} num={finalTotalPrice}/>
                    </PriceWrapper>
                    <button onClick={handleMemberShip} style={{
                        backgroundColor: "white",
                        marginTop: '20px',
                        fontSize: '20px',
                        border: '1px solid grey',
                        borderRadius: '10px'
                    }}>멤버십 할인 적용
                    </button>
                    <PaymentWrapper>
                        <p style={{'display': paymentOpen ? "none" : "block"}}>
                            <PurchaseBtn onClick={handlePayment}> 구매하기</PurchaseBtn></p>
                        <p style={{'display': paymentOpen ? "block" : "none"}}>
                            <PaymentBtn onClick={handleCardPay}>카드 결제</PaymentBtn></p>
                        <p style={{'display': paymentOpen ? "block" : "none"}}>
                            <PaymentBtn onClick={handleMoneyPay}>현금 결제</PaymentBtn></p>
                    </PaymentWrapper>
                    <AlertModal isOpen={cardPayOpen} content={"카드를 삽입해 주세요."} click={setCardPayOpen}/>
                    <InputModal isOpen={moneyPayOpen} content={"받은 금액을 입력해주세요."} click={setMoneyPayOpen}
                                setInput={setMoneyInput} moneyResult={setMoneyPayResultOpen}/>
                    <MoneyModal isOpen={moneyPayResultOpen} click={setMoneyPayResultOpen} total={finalTotalPrice}
                                inputMoney={moneyInput}></MoneyModal>
                </p>

            </ItemWrapper>

        </Wrapper>


    )
}


export default ItemAdd;