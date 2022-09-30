<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/top"/>  

   
   <div class="container" style="text-align:center">
         <div class="row">
        <div class="col-md-12">
           <h2 class="text-center" style="margin: 30px 0;">상품 등록</h2>
           
           <form name="prodF" id="prodF" enctype="multipart/form-data" action="prodForm" method="post">
            <!-- 파일업로드시: enctype="multipart/form-data"-->
            <table class="table table-condensed table-bordered mt-4" style="max-width:800px;margin: 0 auto;">
               <tbody>
                  <tr>
                     <td width="20%" class="fstTd"><b>카테고리</b></td>
                     <td width="80%">
                     <select name="cg_num" id="cg_num">
                           <option value="">::카테고리::</option>
                           
                           <c:forEach var="cvo" items="${cgList}">
                           <option value="${cvo.cg_num}">${cvo.cg_name}</option>
                           </c:forEach>
                           
                     </select>
                	</td>
                  </tr>
                  
                  <tr>
                     <td width="20%" class="fstTd"><b>상품명</b></td>
                     <td width="80%"><input type="text" name="pname" id="pname">
                     <span style="color: red"></span>
                      </td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>제조사</b></td>
                     <td width="80%"><input type="text" name="pcompany"
                        id="pcompany"></td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>원산지</b></td>
                     <td width="80%"><input type="text" name="origin"
                        id="origin"></td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>유통기한</b></td>
                     <td width="80%"><input type="text" name="sbdate"
                        id="sbdate">일</td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>상품스펙</b></td>
                     <td width="80%"><select name="pspec" id="pspec">
                           <option value="NEW" selected>NEW</option>
                           <option value="HIT">HIT</option>
                           <option value="BEST">BEST</option>
                           <option value="rec">추천</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>컬리 단독진행 여부</b></td>
                     <td width="80%"><select name="pspec2" id="pspec2">
                           <option value="no" selected>No</option>
                           <option value="only">Curly Only</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>재활용 우수</b></td>
                     <td width="80%"><select name="pspec3" id="pspec3">
                           <option value="no" selected>No</option>
                           <option value="yes">Yes</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td  class="fstTd"><b>상품이미지</b></td>
                     <td>
                     <input type="file" name="mpimage"><br> 
                     <input type="file" name="mpimage"><br> 
                     <input type="file" name="mpimage"><br>
                  </td>
                  </tr>

                  <tr>
                     <td width="20%" class="fstTd"><b>상품수량</b></td>
                     <td width="80%"><input type="number" name="pqty" id="pqty">
                        개
               <span style="color: red"> </span></td>
                        
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>상품정가</b></td>
                     <td width="80%">
                     <input type="text" name="price" id="price">
      
                        원
                     <span style="color: red"> </span>         
                        </td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>상품판매가</b></td>
                     <td width="80%"><input type="text" name="saleprice"
                        id="saleprice"> 원
                        <span style="color: red"></span>   
                        
                        </td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>상품설명</b></td>
                     <td width="80%"><textarea name="pcontents" id="pcontents" style="resize: none; width:100%"
                           rows="5" cols="60"></textarea></td>
                  </tr>
                  <tr>
                     <td width="20%" class="fstTd"><b>포인트</b></td>
                     <td width="80%"><input type="number" name="point" id="point">
                        POINT</td>
                  </tr>
                  <tr>
                     <td colspan="2" style="text-align:center">
                        <button type="button" onclick="check()" class="btn btn-success" style="text-align:center; background-color:rgb(99, 0, 138);color:white;margin: 8px;border:none;">상품등록</button>
                     </td>
                  </tr>
               </tbody>
            </table>
         </form>
           
        </div>
      </div>            
   </div>
   <script>
      function check(){
         if(!$('#cg_num>option:selected').val()){
            alert('카테고리를 선택하세요');
            $('#cg_num').focus();
            return;
         }
         if(!$('#pname').val()){
            alert('상품명을 입력하세요');
            $('#pname').focus();
            return;
         }
         //isNaN() : is not a number?  숫자가 아니면  true
         let vsbdate=$('#sbdate').val();
         let vprice=$('#price').val();
         let vsaleprice=$('#saleprice').val();
         let vpoint=$('#point').val();
         let vpqty=$('#pqty').val();
         
         if(!vsbdate || isNaN(vsbdate)){
        	 alert('유통기한은 숫자여야 해요');
        	 return;
         }
         
         if(!vpqty || isNaN(vpqty)){
            alert('수량은 숫자여야 해요');
            return;
         }
         
         if(!vprice||isNaN(vprice)){
            alert('가격은 숫자여야 해요');
            return;
         }
         if(!vsaleprice || isNaN(vsaleprice)){
            alert('판매가는 숫자여야 해요');
            return;
         }
         if(!vpoint || isNaN(vpoint)){
            alert('포인트는 숫자여야 해요');
            return;
         }
         
         prodF.submit();
      }
   </script>
   
<c:import url="/foot"/>