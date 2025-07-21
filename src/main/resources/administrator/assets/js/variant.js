
    function addRow() {
    	var index = document.querySelectorAll('#variantTable tbody tr').length;
     	 const table = document.getElementById("variantTable").getElementsByTagName('tbody')[0];
      	console.log(index);
      const row = table.insertRow();
      row.innerHTML = `
        <td><input class="variant-input" type="text" name="variants[${index}].size"></td>
        <td><input class="variant-input" type="text	" name="variants[${index}].sku"></td>
        <td><input class="variant-input" type="number" name ="variants[${index}].quantity"></td>
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