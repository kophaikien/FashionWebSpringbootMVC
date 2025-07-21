package vn.devpro.javawebProject31.service;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.Review;
import vn.devpro.javawebProject31.model.User;

@Service
public class ReviewService extends BaseService<Review> {
		@Override
		public Class<Review> clazz() {
			// TODO Auto-generated method stub
			return Review.class;
		}

		public boolean hasCustomerReviewedProduct(Integer customerId, Integer productId) {
		    String jpql = "SELECT COUNT(r) FROM Review r WHERE r.user.id = :userId AND r.product.id = :productId";
		    Long count = entityManager.createQuery(jpql, Long.class)
		        .setParameter("userId", customerId)
		        .setParameter("productId", productId)
		        .getSingleResult();
		    return count > 0;
		}

		 @Transactional
		    public void saveReview(User user, Product product, BigInteger rating, String comment) {
		        Review review = new Review();
		        review.setUser(user);
		        review.setProduct(product);
		        review.setRating(rating);
		        review.setComment(comment);
		        review.setReviewDate(new Timestamp(System.currentTimeMillis()));

		        entityManager.persist(review);
		    }
		 public List<Review> getReviewsByProductId(Integer productId) {
		        String jpql = "SELECT r FROM Review r "
		                    + "JOIN FETCH r.user "
		                    + "WHERE r.product.id = :productId "
		                    + "ORDER BY r.reviewDate DESC";

		        return entityManager.createQuery(jpql, Review.class)
		                .setParameter("productId", productId)
		                .getResultList();
		    }
}
