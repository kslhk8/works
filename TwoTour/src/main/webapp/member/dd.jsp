 <table border="1" frame="border" rules="all" width="100%" >
      <tr height="70">
         <td width="80">&nbsp;이름</td>
         <td><input type="text" name="name" placeholder="이름입력"></td>
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">아이디</td>
         <td>
         	<input type="text" name="id" size="30" placeholder="아이디입력" onkeydown="inputIdCheck()">
         	<input type="button" value="중복체크" onclick="checkId()">
         	<input type="hidden" name="idCheck" value="uncheck">
         </td>
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">비밀번호</td>
         <td><input type="password" name="pwd" size="40" placeholder="비밀번호입력"></td>
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">재확인</td>
         <td><input type="password" name="repwd" size="40" placeholder="비밀번호입력"></td>
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">성별</td>
         <td>
            <input type="radio" name="gender" value="0">남
            <input type="radio" name="gender" value="1" style="margin-left: 0.5cm;">여
         </td>   
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">이메일</td>
         <td>
         	<input type="text" name="email1" style="margin-right:0.2cm;">
            @
            <select name="email2" style="width:120px; margin-left:0.2cm;">
               <option value="gmail.com">gmail.com</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
            </select>
         </td>   
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">핸드폰</td>
         <td>
         	<select name="tel1" style="width:70px; margin-right:0.2cm;">
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="017">017</option>
               <option value="018">018</option>
               <option value="019">019</option>
            </select>
            -
			<input type="text" name="tel2" size="7" style="margin-right:0.2cm; margin-left:0.2cm;">
            -
            <input type="text" name="tel3" size="7" style="margin-left:0.2cm;">
         </td>   
      </tr>
      <tr>
         <td style="padding-left: 0.2cm;">주소</td>
         <td>
            <input type="text" id="zip" name="zipcode" size="25" style="margin-top: 0.2cm;"> 
				<input type="button" value="우편번호검색" onclick="checkPost()"> 
				<br> 
				<input type="text" id="juso1" name="addr1" size="50"style="margin-top: 0.2cm;" placeholder="주소"> 
				<br> 
				<input type="text" id="juso2" name="addr2" size="50"style="margin-top: 0.2cm; margin-bottom: 0.2cm;" placeholder="상세주소"></td>
      </tr>
      <tr>
      	<td colspan="2" align="center">
      		<input type="button" onclick="javascript:checkWrite()" value="회원가입" style="margin-top:0.2cm; margin-right:0.2cm;">
      		<input type="reset" value="다시작성" style="margin-top:0.2cm;">
      	</td>
      </tr>
   </table>