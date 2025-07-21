package vn.devpro.javawebProject31.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

@Service
public class AprioriService  {
	@PersistenceContext
	private EntityManager entityManager; 
	
	
	public List<Set<Integer>> getAllTransactions(){ 
		String sql = "SELECT sop.sale_order_id, sop.product_id FROM tbl_sale_order_product sop";
		List<Object[]> results = entityManager.createNativeQuery(sql).getResultList(); 
		
		Map<Integer, Set<Integer>> transactionMap = new HashMap<>(); 
		
		for (Object[] r : results) {
			Integer orderId = ((Number) r[0]).intValue(); 
			Integer productId= ((Number) r[1]).intValue(); 
			 if (!transactionMap.containsKey(orderId)) { 
				 transactionMap.put(orderId, new HashSet<Integer>());
			 }
			 transactionMap.get(orderId).add(productId); 
		}
		return new ArrayList<>(transactionMap.values()); 
	}
	public Map<Set<Integer>, Integer> generateFrequentItemsets(List<Set<Integer>> transactions, int minSupport){ 
		Map<Integer, Integer> itemCounts = new HashMap<Integer, Integer>(); 
		
		for (Set<Integer> transaction : transactions) { 
			for (Integer item : transaction) { 
				itemCounts.put(item,itemCounts.getOrDefault(item,0) + 1); 
			}
		}
		Map<Set<Integer>, Integer> results = new HashMap<Set<Integer>, Integer>(); 
		for (Map.Entry<Integer, Integer> entry: itemCounts.entrySet()) { 
			if (entry.getValue() >= minSupport) { 
				results.put(Set.of(entry.getKey()), entry.getValue());
			}
		}
		return results; 
	}
	public Set<Set<Integer>> generateCandidates(Set<Set<Integer>> prevFrequentItemsets){ 
		Set<Set<Integer>> candidates = new HashSet<Set<Integer>>(); 
		List<Set<Integer>> itemsets = new ArrayList<>(prevFrequentItemsets); 
		for (int i = 0; i < itemsets.size(); i++) { 
			for (int j = 0; j < itemsets.size(); j ++) { 
				Set<Integer> a = itemsets.get(i); 
				Set<Integer> b = itemsets.get(j); 
				
				Set<Integer> union = new HashSet<Integer>(a); 
				union.addAll(b);
				if (union.size() == a.size() + 1) { 
					candidates.add(union); 
				}
			}
		}
		return candidates; 
	}
	public int countSuport(Set<Integer> itemset, List<Set<Integer>> transactions) { 
		int count = 0 ; 
		for (Set<Integer> transaction: transactions) { 
			if (transaction.containsAll(itemset)) { 
				count++; 
			}
		}
		return count; 
	}
	// tìm tất cả tập thường xuyên
	public Map<Set<Integer>, Integer> runApriori(List<Set<Integer>> transactions, int minSupport){
		Map<Set<Integer>, Integer> allFrequentItemsets = new HashMap<Set<Integer>, Integer>(); 
		Map<Set<Integer>, Integer> currentLSet = generateFrequentItemsets(transactions, minSupport); 
		
		int k = 2; 
		while (!currentLSet.isEmpty()) { 
			allFrequentItemsets.putAll(currentLSet);
			Set<Set<Integer>> candidates = generateCandidates(currentLSet.keySet());
			Map<Set<Integer>, Integer> nextSet = new HashMap<Set<Integer>, Integer>(); 
			for (Set<Integer> candidate: candidates) {
				int support = countSuport(candidate, transactions); 
				if (support >= minSupport) { 
					nextSet.put(candidate,support); 
				}
			}
			currentLSet = nextSet;
			
		}
		return allFrequentItemsets;
	}
	public List<Set<Integer>> generateNonEmptySubsets(Set<Integer> set) {
	    List<Set<Integer>> subsets = new ArrayList<>();
	    List<Integer> list = new ArrayList<>(set);

	    int n = list.size();
	    for (int i = 1; i < (1 << n); i++) {
	        Set<Integer> subset = new HashSet<>();
	        for (int j = 0; j < n; j++) {
	            if ((i & (1 << j)) != 0) {
	                subset.add(list.get(j));
	            }
	        }
	        subsets.add(subset);
	    }
	    return subsets;
	}
	public void generateAssociationRules(Map<Set<Integer>, Integer> frequentItemsets, int totalTransactions, double minConfidence) {
	    for (Set<Integer> itemset : frequentItemsets.keySet()) {
	        if (itemset.size() < 2) continue;

	        List<Set<Integer>> subsets = generateNonEmptySubsets(itemset);
	        for (Set<Integer> antecedent : subsets) {
	            Set<Integer> consequent = new HashSet<>(itemset);
	            consequent.removeAll(antecedent);

	            if (consequent.isEmpty()) continue;

	            int itemsetSupport = frequentItemsets.getOrDefault(itemset, 0);
	            int antecedentSupport = frequentItemsets.getOrDefault(antecedent, 0);

	            if (antecedentSupport == 0) continue;

	            double confidence = (double) itemsetSupport / antecedentSupport;
	            if (confidence >= minConfidence) {
	                System.out.println(antecedent + " => " + consequent + " (conf: " + confidence + ")");
	            }
	        }
	    }
	}
	public Set<Integer> suggestFromProduct(Integer productId, Map<Set<Integer>, Integer> frequentItemsets, double minConfidence) {
	    Set<Integer> suggested = new HashSet<>();
	    Set<Integer> currentItem = Set.of(productId);

	    for (Set<Integer> itemset : frequentItemsets.keySet()) {
	        if (itemset.size() < 2 || !itemset.contains(productId)) continue;

	        Set<Integer> antecedent = new HashSet<>(currentItem);
	        Set<Integer> consequent = new HashSet<>(itemset);
	        consequent.removeAll(antecedent);

	        if (consequent.isEmpty()) continue;

	        int itemsetSupport = frequentItemsets.get(itemset);
	        int antecedentSupport = frequentItemsets.getOrDefault(antecedent, 0);
	        if (antecedentSupport == 0) continue;

	        double confidence = (double) itemsetSupport / antecedentSupport;
	        if (confidence >= minConfidence) {
	            suggested.addAll(consequent);
	        }
	    }

	    return suggested;
	}

}
