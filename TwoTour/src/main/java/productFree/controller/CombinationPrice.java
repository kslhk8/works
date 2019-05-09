package productFree.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import productFree.bean.AirplaneDTO;

public class CombinationPrice implements Comparator<AirplaneDTO> {
	private List<AirplaneDTO> airplaneList;
	
	public CombinationPrice(List<AirplaneDTO> list) {
		this.airplaneList = list;
	}
	public HashMap<Integer, List<AirplaneDTO>> makeSeq() {
		//seq를 사용하면 안될거같으니 ㅠㅠㅠㅠ
		//System.out.println("airplaneList"+airplaneList);
		Map<String, Integer> departMap = new HashMap<String, Integer> ();
		Map<String, Integer> entryMap = new HashMap<String, Integer> ();

		for(AirplaneDTO t : airplaneList) {
			
			if(t.getDepart_city().equals("인천ICN") && t.getAirplane_name().equals("대한항공")) {
				departMap.put(t.getDepart_time(), t.getAdult_cost());
				}else if(t.getAirplane_name().equals("대한항공")){
				entryMap.put(t.getDepart_time(), t.getAdult_cost());
			}
		}
		
		for(Map.Entry<String, Integer> e : departMap.entrySet()) {
		    //System.out.println(e.getKey() + " : " + e.getValue());
		}

		
		
		HashMap<Integer, List<String>> combiMap = new HashMap<Integer, List<String>>();

		
		List<Integer> sumList = new ArrayList<Integer>();
		int cnt = 0;
		boolean tf = false;

		for(Map.Entry<String, Integer> e : departMap.entrySet()) {
		    //System.out.println("바깥for  :"+e.getKey() + " : " + e.getValue());
		    for(Map.Entry<String, Integer> t : entryMap.entrySet()) {
		    	//System.out.println("안for  :"+t.getKey() + " : " + t.getValue());
		    	int sum = e.getValue()+t.getValue();
		    	//System.out.println("욕나옴:"+sum);
		    	//0:779000,	1:791400,	2:791400,	3:803800,	4:803800,	5:816200,
		    	
		    	List<String> list = new ArrayList<String>();
		    	list.add(e.getKey());
		    	list.add(t.getKey());
		    	//System.out.println(list);
		    	
		    	//combiMap.put(sum, list);
		    	//System.out.println("for들어가기전:"+sumList);
		    	if(cnt!=0) {
		    		for(int i=0; i<sumList.size(); i++	) {
			    		//System.out.println(cnt+" : "+i);
			    		if(sumList.get(i) == sum) {
			    			//System.out.println("걸리기만해:"+i);
			    			//System.out.println("누구야"+sumList.get(i));
			    			sumList.remove(i);
			    			tf=true;
			    			List<String> specialList = combiMap.get(sum);
			    			//System.out.println("inSide_list :"+specialList);
			    			specialList.add(e.getKey());
			    			specialList.add(t.getKey());
			    			combiMap.put(sum, specialList);
			    			//System.out.println(cnt+"번째 :"+combiMap.get(sum));
			    			break;
			    		}
			    		
			    	}
		    	}
		    	
		    	if(!tf) {
		    		combiMap.put(sum, list);
		    		
		    		//System.out.println(cnt+"번째 :"+combiMap.get(sum));
		    	}
		    	sumList.add(sum);
		    	
		    	cnt++;
		    	//System.out.println(cnt);
		    	tf=false;
		    }
		}
		HashMap<Integer, List<AirplaneDTO>> combiMap1 = new HashMap<Integer, List<AirplaneDTO>>();
		for(Map.Entry<Integer, List<String>> e : combiMap.entrySet()) {
		   // System.out.println(e.getKey() + " : " + e.getValue());
		    List<AirplaneDTO> list = new ArrayList<AirplaneDTO>();
		    for(int i=0; i<e.getValue().size(); i++) {
		    	
		    	if(i%2==0) {
		    		for(AirplaneDTO t : airplaneList) {
		    			
			    		if(t.getDepart_city().equals("인천ICN")&& t.getDepart_time().equals(e.getValue().get(i))) {
			    			//System.out.println("짝수:"+e.getValue().get(i));
			    			list.add(t);
			    		}
			    	}
		    	}else {
		    		for(AirplaneDTO t : airplaneList) {
		    		
			    		if(!(t.getDepart_city().equals("인천ICN")) && t.getDepart_time().equals(e.getValue().get(i))) {
			    			//System.out.println("홀수:"+e.getValue().get(i));
			    			list.add(t);
			    		}
			    	}
		    	}
		    	
		    	
		    }//for
		    combiMap1.put(e.getKey(), list);
	    	//System.out.println("t+list:"+list);
	    	//System.out.println("t+combiMap1:"+combiMap1.get(e.getKey()));
		}
		return combiMap1;
		
	}

	@Override
	public int compare(AirplaneDTO arg0, AirplaneDTO arg1) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	
}
