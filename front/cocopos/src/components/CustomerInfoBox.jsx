import React, {useState} from "react";
import styled from "styled-components";
import axios from "axios";

const Title = styled.div`
  display: flex;
  height: 50px;
  width: 150px;
  justify-content: flex-start;
  align-items: center;
  font-size: 20px;

`
const InputBox = styled.input`
  display: flex;
  margin-left: 10px;
  padding-left: 10px;
  margin-right: 20px;
  border: 1px solid grey;
  width: 200px;
  height: 30px;
  font-size: 20px;
  justify-content: flex-start;
`

const ContentBox = styled.div`
  margin-left: 10px;
  padding-left: 10px;
  border: 1px solid grey;
  width: 300px;
  height: 30px;
`
const Wrapper = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;

`
//@GetMapping("/coupon/{id}")
//     public Coupon getCouponById(@PathVariable int id) {
//         return couponRepository.getCouponById(id);
//     }
const CustomerInfoBox = ({title, content = "내용", inputBox = false, handleChange, totalPrice, view}) => {
    const [coupon, setCoupon] = useState(0)//쿠폰 적용시 쿠폰 이름
    const inputHandle = (e) => {
        setCoupon(e.target.value)

    }
    const handleCoupon = () => {
        console.log('쿠폰 적용')
        let temp = Number(totalPrice) - Number(coupon) * 1000
        handleChange(temp)
        axios({
            method: "GET",
            url: `http://localhost:8080/coupon/${coupon}`,
        }).then((res) => {
            console.log(res)
        }).catch((err) => {
            console.log(err)
        })
    }
    return (
        <Wrapper>
            <Title>
                {title}
                {/*<SaleLink to='/sale'>상품</SaleLink>*/}

            </Title>
            {inputBox === true ?

                (<>
                    <InputBox onChange={inputHandle}/>
                    {view
                        ?
                        <button onClick={handleCoupon}
                                style={{
                                    width: '80px',
                                    height: '30px',
                                    fontSize: '20px',
                                    border: '1px solid grey',
                                    background: 'none',
                                    borderRadius: '10px'
                                }}>적용</button>
                        :
                        <></>}
                    </>

                    )
                    :
                    <ContentBox>{content}</ContentBox>
                    }
        </Wrapper>
    )
}


export default CustomerInfoBox;
