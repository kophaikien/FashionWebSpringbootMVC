 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- [Head] start -->

<head>
  <title>Home |ColoShop dashboard </title>
  <!-- [Meta] -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Mantis is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
  <meta name="keywords" content="Mantis, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Bootstrap Admin Template">
  <meta name="author" content="CodedThemes">
  <!-- variable-->
      <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  
	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	<style> 
	.section-title {
      margin-top: 30px;
      font-size: 18px;
      font-weight: 600;
      border-bottom: 1px solid #ddd;
      padding-bottom: 6px;
      color: #444;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 10px;
    }

    th {
      background-color: #f2f4f7;
      text-align: left;
    }

    tr:nth-child(even) {
      background-color: #fafafa;
    }
.variant-input {
        width: 100%;
        padding: 0 !important;
        border: none !important; 
        border-radius: 0; /* không bo góc */
        background-color: transparent;
        font-family: inherit;
      }
      .variant-input:focus{ 
        outline: none;
      }
      .btn-add-row {
        margin-top: 10px;
        padding: 8px 14px;
        border: none;
        background-color: #1890FF;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
      }
      .btn-delete-row{ 
      	background-color: #444; 
      	margin-top: 10px;
        padding: 8px 14px;
        border: none;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
      }
      .btn-add-row:hover {
        background-color: #222;
      }
      .btn-submit {
        margin-top: 30px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
      }
      .btn-submit:hover {
        background-color: #0056b3;
      }
      .variant-container{ 
	    padding-left: 0;
   	 	box-sizing: border-box;
    	padding-right: 24px;
    	margin-left: 12px;
	}
	</style>
</head>
<!-- [Head] end -->
<!-- [Body] Start -->

<body data-pc-preset="preset-1" data-pc-direction="ltr" data-pc-theme="light">
  <!-- [ Pre-loader ] start -->
<div class="loader-bg">
  <div class="loader-track">
    <div class="loader-fill"></div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
 
 <div class="pc-container">
    <div class="pc-content">
      <!-- [ breadcrumb ] start -->
      <div class="page-header">
        <div class="page-block">
          <div class="row align-items-center">
            <div class="col-md-12">
              <div class="page-header-title">
                <h5 class="m-b-10">Sửa Sản Phẩm</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
 		<div class="row">
        <!-- [ link-button ] start -->
        <div class="col-sm-12">
          <div class="card">
         
              <div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
                <div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${path }/admin/product/edit-save" method="post" modelAttribute="product" enctype="multipart/form-data">
	                        		 
	                        		 <div class="form-body">

										<sf:hidden path="id" />
										<!-- id > 0 -> Edit -->
	                        		 	
	                        			<div class="row">
	                        			<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Tên sản phẩm</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="product name"></sf:input>
                                        		</div>
	                                    	</div>
	                        		 		
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category">Chọn Danh Mục</label>
			                                        <sf:select path="category.id" class="form-control" id="category">
			                                            <sf:options items="${categories }" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
	                                    	<div class="col-md-6">
														<div class="form-group mb-4">
					                                        <label for="originalPrice">Giá Gốc</label>
					                                        <sf:input path="originalPrice" type="number" autocomplete="off" id="originalPrice" name="originalPrice" class="form-control" placeholder="Original Price"></sf:input>
		                                        		</div>
			                                    	</div>
										</div>
										<div class="row">
												
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="price">Giá Bán</label>
			                                        <sf:input path="price" type="number" autocomplete="off" id="price" name="price" class="form-control" placeholder="price"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="salePrice">Giá Sale</label>
			                                        <sf:input path="salePrice" type="number" autocomplete="off" id="salePrice" name="salePrice" class="form-control" placeholder="Sale price"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	</div>
										
	                        		 		<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="saleValue">Chọn loại giảm giá</label>
			                                        <sf:select path="saleValue.id" class="form-control" id="saleValue">
			                                            <sf:options items="${saleValues }" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>									
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Ngày tạo</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate">Ngày Cập nhật</label>
			                                       
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Mô tả</label>
			                                        <sf:textarea path="shortDescription" id="shortDescription" name="shortDescription"
																class="form-control" rows="3" placeholder="Short desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="Additional">Thông tin thêm</label>
			                                        <sf:textarea path="additionalInfo" id="additionalInfo" name="additionalInfo"
																class="form-control" rows="3" placeholder="Additional Info..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-2">
												<div class="form-group mb-4">
													<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="isHot" class="form-check-input" id="isHot" name="isHot"></sf:checkbox>
			                                        <label for="isHot">Is a hot product?</label>
			                                       
                                        		</div>
	                                    	</div>
	                                    	
	                                    	
										</div>
										<div class="row variant-container"> 
										 <div class="section-title">Biến thể sản phẩm</div>
											    <table id="variantTable">
											      <thead>
											        <tr>
											          <th>Size</th>
											          <th>SKU</th>
											          <th>Tồn kho</th>
											        </tr>
											      </thead>
											      <tbody>
											      <c:forEach items="${product.variants}" var="variant" varStatus="loop">
											        <tr>
											          
											           <td><input class="variant-input" type="text" name="variants[${loop.index}].size" value="${variant.size}"></td>
											           <td><input class="variant-input" type="text"  name="variants[${loop.index}].sku" value="${variant.sku}" ></td>
											           <td><input class="variant-input" type="text"  name="variants[${loop.index}].quantity" value="${variant.quantity}"> </td>
											       <td><input type="hidden" class="variant-input" type="text" name="variants[${loop.index}].id" value="${variant.id}"></td>
											        </tr>
											        </c:forEach>
											      </tbody>
											    </table>
											
											    <button type="button" class="btn-add-row mb-3" onclick="addRow()">+ Thêm biến thể</button>
												<button type="button" class="btn-delete-row mb-5 " onclick="deleteLastRow()">Xóa biến thể</button>
											  </div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="avatarFile">Choose product Avatar</label>
                                    				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${path }/admin/product/view" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Save edit product</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		 </div> 
	                        	</sf:form>
	                        </div>
	                    </div>    
                  </div> 
				
				</div>

				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
            </div>
          </div>
          </div>
        </div>
        <!-- [ link-button ] end -->
      </div>
      <!-- [ Main Content ] end -->

 <jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>

  <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
  <script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script>
	<script>
	    ClassicEditor
	        .create(document.querySelector('#additionalInfo'))
	        .catch(error => {
	            console.error(error);
	        });
	</script>
    <script>
   

    function addRow() {
    	var index = document.querySelectorAll('#variantTable tbody tr').length;
     	 const table = document.getElementById("variantTable").getElementsByTagName('tbody')[0];
      	console.log(index);
      const row = table.insertRow();
      row.innerHTML = `
        <td><input class="variant-input" type="text" name="variants[\${index}].size"></td>
        <td><input class="variant-input" type="text	" name="variants[\${index}].sku"></td>
        <td><input class="variant-input" type="number" name ="variants[\${index}].quantity"></td>
      `;
     
    }
    
    function deleteLastRow(){ 
    	var btn = document.querySelector('.btn-delete-row'); 
    	var rows = document.querySelectorAll('#variantTable tbody tr').length;
    	const table = document.getElementById("variantTable").getElementsByTagName('tbody')[0];
		if (rows > 0){ 
			 	table.deleteRow(rows-1); 
		}else{ 
			btn.disabled = true; 
		}
		
		
    }
  </script>
</body>