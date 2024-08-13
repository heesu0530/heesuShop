package com.ecom6.wrapper.order;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.service.order.OrderService;
import com.ecom6.service.product.ProductService;
import com.ecom6.vo.order.OrderVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("orderWrapper")
public class OrderWrapper {
	@Autowired
	private OrderService orderService;
	
    @Autowired
    private ProductService productService;

    @Transactional
	public HashMap<String, Object> orderProc(OrderVo ovo, Hashtable<Integer, OrderVo> hCartList) {
		String url;
		String msg;
		
		int r = orderService.insertOrders(hCartList);
		if(r>0) {
			productService.updateStocks(hCartList);
			msg="주문완료했습니다.";
			url = "orderList";
			hCartList.clear();
		}else {
			msg="주문을 실패했습니다.\\n 관리자에게 문의바랍니다.";
			url="cartList";
		}
		HashMap<String, Object> reMap = new HashMap<String, Object>();
         reMap.put("msg", msg);		
         reMap.put("url", url);		
         reMap.put("hCartList", hCartList);		
		return reMap;
	}

    @Transactional
	public Map<String, Object> orderDelete(OrderVo ovo) {
    	log.info("wrapper==>"+ovo);
    	Map<String, Object> reSet = new HashMap<>();
    	String msg=null;
    	// 삭제가 가능한지 확인(1,2) 나머지는 삭제가 불가능합니다. 반품로직으로 이동
    	switch (ovo.getState()) {
		case 1: 
		case 2: {
			// 삭제가 가능하면 상품 재고 추가하고
			int r= productService.updateStock(ovo);
			if(r>0) {
				int dr = orderService.deleteOrder(ovo);
				if(dr>0) {
					msg= "해당 주문 삭제하고 \\n 환불시스템으로 이동합니다";
				}else {
					msg = "주문 삭제 실패했습니다.\\n 해당주문이 없습니다.";
				}
			}else {
				/* throw new Exception("처리중 오류가 발생했습니다."); */
				msg = "처리중 오류가 발생했습니다.";
			}
			break;
		}
		default:
			//삭제불가
			msg="해당 주문은 삭제가 불가하므로 \\n 반품을 통해 처리해야합니다.";
		}
    	reSet.put("msg", msg);
		return reSet;
	}
}
