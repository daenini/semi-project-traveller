
        function changeNumber(desc, formId) {
    		console.log(formId);
    		var form = document.getElementById(formId);
    		if (desc == '+') {
    			form.cart_qty.value = parseInt(form.cart_qty.value) + 1;
    		} else if (desc == '-') {
    			if (form.cart_qty.value - 1 >= 0) {
    				form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
    			}
    		}
    		form.method = 'POST';
    		form.action = 'cart_update_item_action.jsp';
    		form.submit();
    	}
    	/*
    	cart item1개삭제하기
    	 */
    	function cart_delete_item_action(formId) {
    		if(window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')){
    			var form = document.getElementById(formId);
    			form.method = 'POST';
    			form.action = 'cart_delete_item_action.jsp';
    			form.submit();
    		}
    		
    	}
    	/*
    	cart 전체삭제(비우기)
    	 */
    	function cart_delete() {
    		if(confirm("장바구니를 비우시겠습니까 ?")){
    		document.cart_view_form.method = 'POST';
    		document.cart_view_form.action = 'cart_delete_all_action.jsp';
    		document.cart_view_form.submit();
    		}
    	}
    	function cart_view_form_submit() {
    		document.cart_view_form.method = 'POST';
    		document.cart_view_form.buyType.value = 'cart';
    		document.cart_view_form.action = 'order_create_form.jsp';
    		document.cart_view_form.submit();
    	}
    	function cart_view_form_select_submit() {
    		var cart_item_no_check_list = document
    				.getElementsByName("cart_item_no_check");
    		var isChecked = false;
    		for (var i = 0; i < cart_item_no_check_list.length; i++) {
    			if (cart_item_no_check_list.item(i).checked === true) {
    				document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"
    						+ cart_item_no_check_list.item(i).value + "'>"
    				isChecked = true;
    			}
    		}
    		if (!isChecked) {
    			alert('제품을선택해주세요');
    			return;
    		}
    		document.cart_view_form.buyType.value = 'cart_select';
    		document.cart_view_form.method = 'POST';
    		document.cart_view_form.action = 'r_order.jsp';
    		document.cart_view_form.submit();
    	}
    	function cart_item_all_select_checkbox_deselect(){
    		document.getElementById('all_select_checkbox').checked=false;
    	}
    	function cart_item_select_count(){
    			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
    			var cart_item_check_selected_count = 0;
    			for (var i = 0; i < cart_item_no_check_list.length; i++) {
    				if (cart_item_no_check_list.item(i).checked === true) {
    					cart_item_check_selected_count++;
    				}
    			}
    			document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
    			
    	}
    	function cart_item_all_select(e){
    		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
    		if(e.target.checked){
    			for (var i = 0; i < cart_item_no_check_list.length; i++) {
    				cart_item_no_check_list.item(i).checked=true;
    			}
    		}else{
    			for (var i = 0; i < cart_item_no_check_list.length; i++) {
    				cart_item_no_check_list.item(i).checked=false;
    			}
    		}
    	}
        	
