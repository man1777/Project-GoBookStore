package com.poly.main.serviceImplements;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired UserDao dao;
	@PersistenceContext
    private EntityManager entityManager;

@Override
public List<User> findAll() {
	// TODO Auto-generated method stub
	return dao.findAll();
};
@Override 
public User insert(User user) {
	return dao.save(user);
};
@Override 
 public void delete(Integer id_User) {
	dao.deleteById(id_User);
};
//@Override
//public List<User> findByEmpl(){
//	return dao.findByEmpl();
//}
@Override
public List<User> selectMaNV(){
	return dao.selectMaNV();
}
@Override
public Integer getUserToday(String date) {
	StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_getUserToday");
	query.registerStoredProcedureParameter("date", String.class, ParameterMode.IN);
	query.registerStoredProcedureParameter("userCount", Integer.class, ParameterMode.OUT);
	query.setParameter("date", date);
	query.execute();
	Integer userCount = (Integer) query.getOutputParameterValue("userCount");
	return userCount ;
}

}
