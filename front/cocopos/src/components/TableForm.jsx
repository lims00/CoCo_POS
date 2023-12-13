import React, {useState} from "react";
import styled from "styled-components";

const TableWrapper = styled.div`
  display: flex;
  border: 1px solid grey;
  margin: 25px;

`
const TableForm = ({header, items, headerKey, selectable=false ,itemKey, updateSelection}) => {


    // 선택한 row의 itemKey를 담은 배열
    const [selection, setSelection] = useState(new Set());
    const onChangeSelect = (value) => {
        // 기존의 selection으로 새로운 Set 생성
        const newSelection = new Set(selection);
        if (newSelection.has(value)) {
            // value가 있으면 삭제 (checked가 false이기 때문)
            newSelection.delete(value);
        } else {
            // value가 없으면 추가 (checked가 true이기 때문)
            newSelection.add(value);
        }
        // 새로운 Set으로 state 변경
        setSelection(newSelection);
        updateSelection([...newSelection]);
    };
    const getAbledItems = (items) => {
        return items.filter(({ disabled }) => !disabled );
    };
    const onChangeSelectAll = (e) => {
        if (e.target.checked) {
            const allCheckedSelection = new Set(
                getAbledItems(items).map((item) => item[itemKey])
            );
            setSelection(allCheckedSelection);
            // updateSelection 함수 호출
            updateSelection([...allCheckedSelection]);
        } else {
            setSelection(new Set());
            // updateSelection 함수 호출
            updateSelection([]);
        }
    };
    return (
        <TableWrapper>
            <table style={{minWidth: '600px', padding: '10px'}}>
                <thead>
                <tr>{
                    selectable && <th style={{width:'10px'}}><input type="checkbox" /></th>
                }
                    {
                        header.map((header) =>
                            <th key={header.text} style={{minWidth: '30px'}}>
                                {header.text} {/* 컬럼명 바인딩 */}
                            </th>
                        )
                    }
                </tr>
                </thead>
                <tbody>
                {
                    items.map((item, index) => (
                        <tr key={index}>
                            {/* headerKey를 순회하면서 key를 가져옴 */}
                            {
                                selectable && <td style={{width:'10px'}}><input type="checkbox"
                                                                                disabled={item.disabled}
                                                                                checked={selection.has(item[itemKey])}
                                                                                onChange={() => onChangeSelect(item[itemKey])}
                                /></td>
                            }
                            {
                                headerKey.map((key) =>
                                    <td key={key + index} style={{textAlign: 'center'}}>
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


