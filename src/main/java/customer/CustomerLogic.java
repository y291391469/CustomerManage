package customer;

import javax.servlet.http.HttpServletRequest;

import dao.CustomerDao;
import dao.CustomerDaoWithTransaction;
import util.LogUtil;

/**
 * 顧客情報のロジック
 */
public class CustomerLogic {

    /**
     * DAO経由で顧客情報をDBから取得する
     * @param id 取得する顧客情報のID
     * @return 顧客情報Bean
     */
    public CustomerBean load(int id) {
        LogUtil.println(this.getClass().getSimpleName() + "#load");

        CustomerDao customerDao = new CustomerDao();
        CustomerBean customer = customerDao.load(id);

        return customer;
    }

    /**
     * DAO経由で顧客情報をDBに追加する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String add(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#add");
        
        CustomerDaoWithTransaction cdwt = new CustomerDaoWithTransaction();
        cdwt.add(customer);
        // TODO 実装①

        return null;
    }

    /**
     * DAO経由でDBの顧客情報を更新する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String update(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#update");
        
        CustomerDaoWithTransaction cdwt = new CustomerDaoWithTransaction();
        cdwt.update(customer);

        // TODO 実装②

        return null;
    }

    /**
     * DAO経由でDBの顧客情報を削除する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String delete(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#delete");
        
        CustomerDaoWithTransaction cdwt = new CustomerDaoWithTransaction();
        cdwt.delete(customer.getId());

        // TODO 実装③

        return null;
    }

    /**
     * リクエスト内の顧客情報をセッションに顧客情報Beanとして設定する
     * @param request 顧客情報を含むリクエスト
     */
    public void setCustomerBeanFromRequestToSession(HttpServletRequest request) {
        LogUtil.println(this.getClass().getSimpleName() + "#setCustomerBeanFromRequestToSession");
        
        //HttpSession session = request.getSession();
        //UserBean user = (UserBean) session.getAttribute("user");
        //要チェック
        
        // TODO 未実装

    }
}