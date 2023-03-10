package xop3d.controller;


import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import Recaptcha.CaptchaConfig;
import xop3d.bean.cart;
import xop3d.entity.advertise;
import xop3d.entity.customer;
import xop3d.entity.menu;
import xop3d.entity.orderDetail;
import xop3d.entity.product;
import xop3d.entity.productDetail;
import xop3d.entity.user;

@Transactional
@Controller
@RequestMapping("/home")
public class MainController {
	@Autowired
	SessionFactory factory;
	public static int dem =0;
	public static String key="HEHE";
	@RequestMapping("index")
	public String Index() {
		return "index";
	}
	@ModelAttribute("menu")
	public List<menu> Nav(ModelMap model) {
		Session session = this.factory.getCurrentSession();
		String hql="FROM menu";
		Query query=session.createQuery(hql);
		List<menu> list = query.list();
		model.addAttribute("username", username);
		return list;
	}
	
	@ModelAttribute("banner")
	public List<advertise> banner(ModelMap model) {
		Session session = this.factory.getCurrentSession();
		String hql = "FROM advertise";
		Query query =session.createQuery(hql);
		List<advertise> list = query.list();
		return list;
	}
	@ModelAttribute("newproduct")
	public List<product> newpro(ModelMap model) {
		Session session = this.factory.getCurrentSession();
		String hql = "FROM product pr where pr.status = '1' ORDER BY date DESC"; // loc Giam Dan
		Query query =session.createQuery(hql).setMaxResults(10);
		List<product> list = query.list();
		return list;
	}
	@ModelAttribute("bestproduct")
	public List<product> bestpro(ModelMap model) {
		Session session = this.factory.getCurrentSession();
		String hql = "FROM product pr where pr.status = '1' ORDER BY sold DESC";
		Query query =session.createQuery(hql).setMaxResults(10);
		List<product> list = query.list();
		return list;
	}
	@ModelAttribute("subbanner")
	public List<advertise> Subbanner(ModelMap model) {
		Session session = this.factory.getCurrentSession();
		String hql = "FROM advertise";
		Query query =session.createQuery(hql);
		List<advertise> list = query.list();
		return list;
	}
 public static	List<cart> cartlist = new ArrayList<>();
	@ModelAttribute("listGioHang")
	public List<cart> getListGioHang() {
		return cartlist;
	}
	@RequestMapping("shopping")
	public String shopping(Model model,@RequestParam("id") String id, @RequestParam("name") String name,@RequestParam("coler") String coler, @RequestParam("gia") float gia,
			@RequestParam("image") String image) {
		boolean isExist = false;
		for (cart item : cartlist) {
			if (item.getIdSanPham().equals(id) ) {
				item.setSoLuong(item.getSoLuong() + 1);
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			dem++;
			cart ghi = new cart();
			ghi.setIdSanPham(id);
			ghi.setTenSanPham(name);
			ghi.setGiaSanPham(gia);
			ghi.setSoLuong(1);
			ghi.setImage(image);
			cartlist.add(ghi);
		}
		System.out.print(cartlist.toString());
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
      model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "index";
	}
	@RequestMapping("shopping-list")
	public String shoppingl(Model model,@RequestParam("id") String id, @RequestParam("name") String name,@RequestParam("coler") String coler, @RequestParam("gia") float gia,
			@RequestParam("image") String image) {
		boolean isExist = false;
		for (cart item : cartlist) {
			if (item.getIdSanPham().equals(id) ) {
				item.setSoLuong(item.getSoLuong() + 1);
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			dem++;
			cart ghi = new cart();
			ghi.setIdSanPham(id);
			ghi.setTenSanPham(name);
			ghi.setGiaSanPham(gia);
			ghi.setSoLuong(1);
			ghi.setImage(image);
			cartlist.add(ghi);
		}
		System.out.print(cartlist.toString());
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
      model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
      return "redirect:/list/pro.htm";
	}
	@RequestMapping("shopping-now")
	public String shoppingnow(Model model,@RequestParam("id") String id, @RequestParam("name") String name,@RequestParam("coler") String coler, @RequestParam("gia") float gia,
			@RequestParam("image") String image) {
		boolean isExist = false;
		for (cart item : cartlist) {
			if (item.getIdSanPham().equals(id) ) {
				item.setSoLuong(item.getSoLuong() + 1);
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			dem++;
			cart ghi = new cart();
			ghi.setIdSanPham(id);
			ghi.setTenSanPham(name);
			ghi.setGiaSanPham(gia);
			ghi.setSoLuong(1);
			ghi.setImage(image);
			cartlist.add(ghi);
		}
		System.out.print(cartlist.toString());
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
      model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "redirect:/home/order.htm";
	}
	@RequestMapping("deletecart")
	public String deletecart(Model model,@RequestParam("idSanPham") String idSanPham){
		int k=0;
		for(int i=0; i<cartlist.size();i++){
			if(cartlist.get(i).getIdSanPham().equals(idSanPham)){
				k=i;
			}
		}
		dem--;
		cartlist.remove(k);
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
		 model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "index";	
	}
	@RequestMapping("deletecart-list")
	public String deletecartl(Model model,@RequestParam("idSanPham") String idSanPham){
		int k=0;
		for(int i=0; i<cartlist.size();i++){
			if(cartlist.get(i).getIdSanPham().equals(idSanPham)){
				k=i;
			}
		}
		dem--;
		cartlist.remove(k);
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
		 model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "redirect:/list/pro.htm";	
	}
	@RequestMapping("deletecart-od")
	public String deletecarto(Model model,@RequestParam("idSanPham") String idSanPham){
		int k=0;
		for(int i=0; i<cartlist.size();i++){
			if(cartlist.get(i).getIdSanPham().equals(idSanPham)){
				k=i;
			}
		}
		dem--;
		cartlist.remove(k);
		model.addAttribute("dem",dem);
		model.addAttribute("cart",cartlist);
		 model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "redirect:/home/order.htm";	
	}
	public static Float tinhTongtien (List<cart> list) {
		Float tongTien=(float) 0;
		for(cart item1: list) {
			tongTien=(tongTien+item1.getGiaSanPham()*item1.getSoLuong());
		}
		return tongTien;
	}
	public static int tinhTongSP (List<cart> list) {
		int tongSP=0;
		for(cart item1: list) {
			tongSP=tongSP+item1.getSoLuong();
		}
		return tongSP;
	}
	@RequestMapping(value="order")
	public String order(ModelMap model){
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		String hql2 = "FROM productDetail";
		Query query=s.createQuery(hql2);
		List<productDetail> list1 = query.list();
		for (productDetail pd : list1) {
			for (cart item : cartlist ) {
				if(pd.getProduct().getId().equals(item.getIdSanPham())) {
					item.setSize(pd.getSize());
					break;
				}
			}
		}
		model.addAttribute("customer", new customer());
		model.addAttribute("cart", cartlist);
		model.addAttribute("prode", list1);
		model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
		return "order";
	}
	@RequestMapping(value = "order", method=RequestMethod.POST)
	public String order(Model model,HttpServletRequest re) {
		int size = 0;
		int sl = 0;
		ArrayList<String> listid = new ArrayList<>();
		customer cus = new customer();
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		xop3d.entity.order o = new xop3d.entity.order();
		try{
			cus.setName(re.getParameter("name"));
			cus.setEmail(re.getParameter("email"));
			cus.setPhone( Integer.parseInt(re.getParameter("phone")));
			cus.setAddress(re.getParameter("address"));
			cus.setCode(re.getParameter("code"));
			
			o.setStatus(1);
			o.setUser(userlogin);
			o.setDate(new Date());
			o.setCustomer(cus);
			o.setTotal(tinhTongtien(cartlist));
			s.save(cus);
			s.save(o);
			int madon = 0;
			for (cart item : cartlist) {
				orderDetail od = new orderDetail();
				product pro = (product)s.get(product.class, item.getIdSanPham());
				sl = Integer.parseInt(re.getParameter("sl" + item.getIdSanPham()));
				size = Integer.parseInt(re.getParameter("size" + item.getIdSanPham()));
				item.setSoLuong(sl);
				item.setSize(size);
				pro.setSold(pro.getSold()+1);
				s.update(pro);
				od.setSize(size);
				System.out.println(pro.toString());
				od.setProduct(pro);
				od.setOrder(o);
				od.setQuanlity(item.getSoLuong());
				s.save(od);
				madon=od.getId();
				listid.add(pro.getId());
			}
			
			t.commit();
			System.out.println("th??m");
			for (String string : listid) {
				updatesl(string, size, sl);
			}
			thongbao(madon,re.getParameter("email"),re.getParameter("name"));
			model.addAttribute("message", "?????t h??ng th??nh c??ng ! Quay v??? trang ch??? ????? ti???p t???c mua h??ng");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "?????t h??ng th???t b???i ! ");
			System.out.println("faile");
		}
		finally{
			s.close();
		}
		return "order";
	}
	@RequestMapping("order-pr")
	public String themsl(ModelMap model,HttpServletRequest re) {
		for(cart item : cartlist) {
			int sl = Integer.parseInt(re.getParameter("sl" + item.getIdSanPham()));
			int size = Integer.parseInt(re.getParameter("size" + item.getIdSanPham()));
			item.setSoLuong(sl);
			item.setSize(size);
		}
		order1(model);
		return "order";
	}
	public void order1(ModelMap model){
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		String hql2 = "FROM productDetail";
		Query query=s.createQuery(hql2);
		List<productDetail> list1 = query.list();
		model.addAttribute("customer", new customer());
		model.addAttribute("cart", cartlist);
		model.addAttribute("prode", list1);
		model.addAttribute("tongTien",MainController.tinhTongtien(cartlist));
	}
	public static String username = "Guest";
	public static user userlogin;
	
	@RequestMapping(value = "sign-up" ,method=RequestMethod.POST)
	public String dangki(Model model,HttpServletRequest re,@ModelAttribute("User") user us,BindingResult err) throws ParseException {
		String gRecaptchaResp = re.getParameter("g-recaptcha-response");
		Boolean verify = CaptchaConfig.verify(gRecaptchaResp);
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		boolean temp = true;
		if(us.getUsername().trim().length()==0) {
			err.rejectValue("username","User","Vui l??ng nh???p t??n t??i kho???n");
			temp = false;
		}
		if(us.getAddress().trim().length()==0) {
			err.rejectValue("address","User","Vui l??ng nh???p ?????a ch???");
			temp = false;
		}
		if(us.getEmail().trim().length()==0) {
			err.rejectValue("email","User","Vui l??ng nh???p Email");
			temp = false;
		}
		if(us.getPhone().trim().length()!=10) {
			err.rejectValue("phone","User","Vui l??ng nh???p s??? ??i???n tho???i");
			temp = false;
		}
		if(us.getFullname().trim().length()==0) {
			err.rejectValue("fullname","User","Vui l??ng nh???p H??? v?? t??n");
			temp = false;
		}
		if(us.getGender()==null) {
			err.rejectValue("gender","User","Vui l??ng ch???n gi???i t??nh");
			temp = false;
		}
		if(us.getPassword().trim().length()==0) {
			err.rejectValue("password","User","Vui l??ng nh???p m???t kh???u");
			temp = false;
		}
		if(us.getPassword().trim().equals(re.getParameter("rpass").trim())==false) {
			err.rejectValue("password","User","M???t kh???u kh??ng gi???ng nhau");
			temp = false;
		}
		if(us.getBirthday()==null) {
			err.rejectValue("birthday","User","Vui l??ng nh???p ng??y sinh");
			temp = false;
		}
		String ten=us.getUsername().trim();
		String diachi=us.getAddress().trim();
		String gmail=us.getEmail().trim();
		String phone=us.getPhone();
		String fullname=us.getFullname().trim();
		int gtinh=us.getGender();
		String pass=us.getPassword().trim();
		user us2=new user();
		if(temp==true&&verify) {
			try{
				if(s.get(user.class,us.getUsername().trim())==null) {
					us2.setUsername(MaHoaDes.Encrypt(ten,key));
					us2.setPassword(MaHoaDes.Encrypt(pass,key));
					us2.setPhone(MaHoaDes.Encrypt(phone,key));
					us2.setFullname(fullname);
					us2.setEmail(MaHoaDes.Encrypt(gmail,key));
					us2.setBirthday(us.getBirthday());
					us2.setGender(us.getGender());
					us2.setAddress(diachi);;
					s.save(us2);
					t.commit();
					model.addAttribute("dk",1);
					model.addAttribute("tb", "????ng k?? th??nh c??ng");
				}
				else {
					model.addAttribute("tb", "T??i kho???n ???? t???n t???i , vui l??ng ????ng nh???p");
					System.out.println("faile");
				}
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("tb", "????ng k?? th???t b???i,vui l??ng ki???m tra l???i");
				System.out.println("faile");
			}
			finally{
				s.close();
			}			
		}
		return "user-signup";
	}
	@RequestMapping(value = "sign-up" ,method=RequestMethod.GET)
	public String dangki1(ModelMap model,@ModelAttribute("User") user us) {
		return "user-signup";
	}
	@RequestMapping(value = "forget-pass" ,method = RequestMethod.GET)
	public String quen(ModelMap model) {
		return "forgetpass";
	}
	@Autowired
	JavaMailSender mailer;
	@RequestMapping(value = "forget-pass" ,method = RequestMethod.POST)
	public String quen1(ModelMap model,HttpServletRequest re) {
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		String hql = "FROM user";
		Query query =s.createQuery(hql);
		List<user> list = query.list();
		boolean kiemtra = true;
			for (user kt : list) {
				if(kt.getUsername().equals(re.getParameter("username"))) {
					int random = (int) Math.floor(((Math.random() * 899999) + 100000));/// random sinh s??? c?? 6 ch??? s???
					String matkhaumoi=String.valueOf(random);
					String mailgui;
					mailgui=kt.getEmail();
					kt.setPassword(matkhaumoi);
					s.update(kt);
					kiemtra= false;
					/// update v??o sql
					t.commit();
					/////g???i t???i mail c?? c??i autowire ??? tr??n c??ng nh??? xem
					////////////////////////////////////
					//////////////////////////////////////
					Date date = new Date();
					String from="niemvuicuaem2000@gmail.com";
					String to=mailgui;
					String subject="Qu??n m???t kh???u";
					String body="B???n ???? b??o qu??n m???t kh???u v??o "+date+"  m???t kh???u m???i c???a b???n l?? "+matkhaumoi+"\n N???u b???n kh??ng th???c hi???n y??u c???u tr??n , vui l??ng li??n h??? qu???n tr??? vi??n ngay";
					try {
						System.out.println("t???o mail mailer");
						// t???o mail
				
						MimeMessage mail = this.mailer.createMimeMessage();
						
						
						//g???i l???p tr??? gi??p
						System.out.println("tr??? gi??p");
						MimeMessageHelper helper= new MimeMessageHelper(mail);
						System.out.println("new");
						helper.setFrom(from,from);
						helper.setTo(to);
						helper.setReplyTo(from,from);
						helper.setSubject(subject);
						helper.setText(body,true);
						this.mailer.send(mail);
						System.out.println("g???i");
						model.addAttribute("tinnhan", "M???t kh???u m???i ???? g???i ?????n email c???a b???n");
					}
					catch (Exception ex){
						model.addAttribute("tinnhan","g???i mail th???t b???i");
						t.rollback();
					}
					finally {
						s.close();
					}
				}
			}
			if(kiemtra==true) {
				model.addAttribute("tinnhan", "T??i kho???n kh??ng t???n t???i");
			}
		
			return "forgetpass";
	}
	@RequestMapping(value = "login" ,method=RequestMethod.POST)
	public String dangnhap(Model model,HttpServletRequest re) throws ParseException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		String gRecaptchaResp = re.getParameter("g-recaptcha-response");
		Boolean verify = CaptchaConfig.verify(gRecaptchaResp);
		if(verify)
		{Session session = this.factory.openSession();
		String hql = "FROM user";
		Query query =session.createQuery(hql);
		List<user> list = query.list();
		for (user user : list) {
			String pass1=MaHoaDes.Decrypt(user.getPassword(),"HEHE");
			String username1=MaHoaDes.Decrypt(user.getUsername(),"HEHE");
				if((re.getParameter("user").trim().equals(username1)) && (re.getParameter("pass").trim().equals(pass1))) {
				username = username1;
				model.addAttribute("username", username);
				userlogin = user;
				return "index";
			}
		}
		model.addAttribute("tb", "????ng nh???p th???t b???i vui l??ng ki???m tra l???i !");
		return "user-login";
		}
		model.addAttribute("tb", "vui l??ng x??c th???c !");
		return "user-login";
	}
	@RequestMapping(value = "login" ,method=RequestMethod.GET)
	public String dangnhap1(ModelMap model) {
		username="Guest";
		model.addAttribute("username", username);
		return "user-login";
	}
	public void updatesl(String id ,int size ,int sl) {
		Session s = this.factory.openSession();
		Transaction t = s.beginTransaction();
		String hql2 = "FROM productDetail pd where pd.Product.id = :id and pd.size = :size";
		Query query=s.createQuery(hql2);
		query.setParameter("id",id);
		query.setParameter("size",size);
		List<productDetail> list1 = query.list();
		ArrayList<productDetail> ls = new ArrayList<productDetail>();
		for (productDetail a : list1) {
			ls.add(a);
		}
		for (productDetail a : ls) {
			a.setQuanlity(a.getQuanlity()-sl);
			s.update(a);
			t.commit();
			s.close();
		}
	}
	@Autowired
	JavaMailSender mailer1;
	public void thongbao(int madonhang, String email,String tenkh) {
					Date date = new Date();
					String from="trantuminh968@gmail.com";
					String to= email;
					String subject="?????t h??ng th??nh c??ng !";
					String body="Xin ch??o "+tenkh+" ????n h??ng s??? "+madonhang+" c???a b???n ???? ??c t???o th??nh c??ng v??o l??c "+date+" . Nh??n vi??n c???a h??ng s??? g???i h??ng cho b???n trong th???i gian s???m nh???t. \n Xin c???m ??n!";
					try {
						MimeMessage mail = this.mailer.createMimeMessage();
						MimeMessageHelper helper= new MimeMessageHelper(mail);
						System.out.println("new");
						helper.setFrom(from,from);
						helper.setTo(to);
						helper.setReplyTo(from,from);
						helper.setSubject(subject);
						helper.setText(body,true);
						this.mailer.send(mail);
					}
					catch (Exception ex){
					}
	}
}
