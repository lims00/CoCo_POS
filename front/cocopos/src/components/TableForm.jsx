import React from "react";
import styled from "styled-components";

const TableWrapper = styled.div`
  display: flex;
  border:1px solid grey;
  margin:25px;
  
`
const TableForm=({header,items,headerKey})=>{


    return(
        <TableWrapper>
            <table style={{width: '600px',padding:'10px'}}>
                <thead>
                <tr>
                    {
                        header.map((header) =>
                            <th key={header.text} style={{'width':'30px'}}>
                                {header.text} {/* 컬럼명 바인딩 */}
                            </th>
                        )
                    }
                </tr>
                </thead>
                <tbody >
                {
                    items.map((item, index) => (
                        <tr key={index}>
                            {/* headerKey를 순회하면서 key를 가져옴 */}
                            {
                                headerKey.map((key) =>
                                    <td key={key + index} style={{textAlign:'center'}}>
                                        {item[key]} {/* key로 객체의 값을 출력 */}
                                    </td>
                                )
                            }
                        </tr>
                    ))
                }
                </tbody>

            </table>
        </TableWrapper>

    )
}

export default TableForm;


