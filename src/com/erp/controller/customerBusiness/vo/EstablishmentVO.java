package com.erp.controller.customerBusiness.vo;


import java.math.BigDecimal;
import java.util.Date;

/**
 * 客户
 * @author guo
 */

public class EstablishmentVO {
	public static final String CODE_RULE_CLIENT = "CLIENT";
	public static final String CODE_RULE_PROVIDER = "PROVIDER";
	public static final String CODE_RULE_COOPERATOR = "COOPERATOR";
	private long id;
	private String estName;//名称
	private String estCode;//编号

	private long estTypeId = 0L;//类别   establishment_type 表
	private long estLevelId = 0L;//等级  establishment_level
	private String phone;//电话
	private String fax;//传真
	private String email;//email
	private String webSite;//网站地址
	private String postcode;//邮编
	private long areaId = 0L;//地区
	private String address;//地址
	private String mark;//备注
	private String enabled = "Y";//
	private Date createTime = new Date();//
	private int creditCost = 0;//信用额度
	
	private String bankName1;//
	private String bankAccCode1;//
	private String bankAccName1;//
	private String bankName2;//
	private String bankAccCode2;//
	private String bankAccName2;//
	private Date smsTime;//

	private Date commTime;//
	private BigDecimal busCost = new BigDecimal(0);//合同金额
	private long tallySetId = 0L;//账单
	private long createrId = 0L;//
	
	private String status = "Y";// 状态
	private String busiPphone = "Y";//
	private String deliPphone = "Y";//
	private String makePphone = "N";//
	private Date busTime;//最近交易
	
	private long managerId = 0L;//经办人id
	private String managerName;//经办人
	private long superiorId = 0L;//上级单位
	private String superiorIdStr;//
	private String nameSpell;//名字拼写
	private String estType;//客户类型 	客户CLIENT 合作伙伴(外协商)COOPERATOR	供应商（PROVIDER）
	private String createrName;//创建人
	
	private String linkman;//主要联系人
	private String linkmanPhone;//创建人手机号
	
	private String invoName ;//开票名称
	private String invoCode ;//纳税识别号
	private String invoAddr ;//地址电话
	private String invoBankName ;//开户银行
	private String invoBankCode ;//开户账号
	private String invoType ;//开票类型
	private String payModeId ;//付款方式
	
	public String getPayModeId() {
		return payModeId;
	}

	public void setPayModeId(String payModeId) {
		this.payModeId = payModeId;
	}

	public String getInvoName() {
		return invoName;
	}

	public void setInvoName(String invoName) {
		this.invoName = invoName;
	}

	public String getInvoCode() {
		return invoCode;
	}

	public void setInvoCode(String invoCode) {
		this.invoCode = invoCode;
	}

	public String getInvoAddr() {
		return invoAddr;
	}

	public void setInvoAddr(String invoAddr) {
		this.invoAddr = invoAddr;
	}

	public String getInvoBankName() {
		return invoBankName;
	}

	public void setInvoBankName(String invoBankName) {
		this.invoBankName = invoBankName;
	}

	public String getInvoBankCode() {
		return invoBankCode;
	}

	public void setInvoBankCode(String invoBankCode) {
		this.invoBankCode = invoBankCode;
	}

	public String getInvoType() {
		return invoType;
	}

	public void setInvoType(String invoType) {
		this.invoType = invoType;
	}

	public String getBusiPphone() {
		return this.busiPphone;
	}

	public void setBusiPphone(String busiPphone) {
		this.busiPphone = busiPphone;
	}

	public String getDeliPphone() {
		return this.deliPphone;
	}

	public void setDeliPphone(String deliPphone) {
		this.deliPphone = deliPphone;
	}

	public String getMakePphone() {
		return this.makePphone;
	}

	public void setMakePphone(String makePphone) {
		this.makePphone = makePphone;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLinkman() {
		return this.linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkmanPhone() {
		return this.linkmanPhone;
	}

	public void setLinkmanPhone(String linkmanPhone) {
		this.linkmanPhone = linkmanPhone;
	}

	public Date getBusTime() {
		return this.busTime;
	}

	public void setBusTime(Date busTime) {
		this.busTime = busTime;
	}

	public Date getCommTime() {
		return this.commTime;
	}

	public void setCommTime(Date commTime) {
		this.commTime = commTime;
	}

	public Date getSmsTime() {
		return this.smsTime;
	}

	public void setSmsTime(Date smsTime) {
		this.smsTime = smsTime;
	}

	public String getBankAccCode1() {
		return this.bankAccCode1;
	}

	public void setBankAccCode1(String bankAccCode1) {
		this.bankAccCode1 = bankAccCode1;
	}

	public String getBankAccCode2() {
		return this.bankAccCode2;
	}

	public void setBankAccCode2(String bankAccCode2) {
		this.bankAccCode2 = bankAccCode2;
	}

	public String getBankAccName1() {
		return this.bankAccName1;
	}

	public void setBankAccName1(String bankAccName1) {
		this.bankAccName1 = bankAccName1;
	}

	public String getBankAccName2() {
		return this.bankAccName2;
	}

	public void setBankAccName2(String bankAccName2) {
		this.bankAccName2 = bankAccName2;
	}

	public String getBankName1() {
		return this.bankName1;
	}

	public void setBankName1(String bankName1) {
		this.bankName1 = bankName1;
	}

	public String getBankName2() {
		return this.bankName2;
	}

	public void setBankName2(String bankName2) {
		this.bankName2 = bankName2;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getCreditCost() {
		return this.creditCost;
	}

	public void setCreditCost(int creditCost) {
		this.creditCost = creditCost;
	}

	public String getNameSpell() {
		return this.nameSpell;
	}

	public void setNameSpell(String nameSpell) {
		this.nameSpell = nameSpell;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getAreaId() {
		return this.areaId;
	}

	public void setAreaId(long areaId) {
		this.areaId = areaId;
	}

	public long getEstLevelId() {
		return this.estLevelId;
	}

	public void setEstLevelId(long estLevelId) {
		this.estLevelId = estLevelId;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEstCode() {
		return this.estCode;
	}

	public void setEstCode(String estCode) {
		this.estCode = estCode;
	}

	public String getEstName() {
		return this.estName;
	}

	public void setEstName(String estName) {
		this.estName = estName;
	}

	public long getEstTypeId() {
		return this.estTypeId;
	}

	public void setEstTypeId(long estTypeId) {
		this.estTypeId = estTypeId;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMark() {
		return this.mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWebSite() {
		return this.webSite;
	}

	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public long getManagerId() {
		return this.managerId;
	}

	public void setManagerId(long managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return this.managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getEnabled() {
		return this.enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public long getSuperiorId() {
		return this.superiorId;
	}

	public void setSuperiorId(long superiorId) {
		this.superiorId = superiorId;
	}

	public String getSuperiorIdStr() {
		return this.superiorIdStr;
	}

	public void setSuperiorIdStr(String superiorIdStr) {
		this.superiorIdStr = superiorIdStr;
	}

	public BigDecimal getBusCost() {
		return this.busCost;
	}

	public void setBusCost(BigDecimal busCost) {
		this.busCost = busCost;
	}

	public String getEstType() {
		return this.estType;
	}

	public void setEstType(String estType) {
		this.estType = estType;
	}

	public long getTallySetId() {
		return this.tallySetId;
	}

	public void setTallySetId(long tallySetId) {
		this.tallySetId = tallySetId;
	}

	public long getCreaterId() {
		return this.createrId;
	}

	public void setCreaterId(long createrId) {
		this.createrId = createrId;
	}

	public String getCreaterName() {
		return this.createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	@Override
	public String toString() {
		return "EstablishmentVO [id=" + id + ", estName=" + estName + ", estCode=" + estCode + ", estType=" + estType
				+ ", estTypeId=" + estTypeId + ", estLevelId=" + estLevelId + ", phone=" + phone + ", fax=" + fax
				+ ", email=" + email + ", webSite=" + webSite + ", postcode=" + postcode + ", areaId=" + areaId
				+ ", address=" + address + ", mark=" + mark + ", managerId=" + managerId + ", managerName="
				+ managerName + ", enabled=" + enabled + ", superiorId=" + superiorId + ", superiorIdStr="
				+ superiorIdStr + ", createTime=" + createTime + ", creditCost=" + creditCost + ", nameSpell="
				+ nameSpell + ", bankName1=" + bankName1 + ", bankAccCode1=" + bankAccCode1 + ", bankAccName1="
				+ bankAccName1 + ", bankName2=" + bankName2 + ", bankAccCode2=" + bankAccCode2 + ", bankAccName2="
				+ bankAccName2 + ", smsTime=" + smsTime + ", busTime=" + busTime + ", commTime=" + commTime
				+ ", busCost=" + busCost + ", tallySetId=" + tallySetId + ", createrId=" + createrId + ", createrName="
				+ createrName + ", linkman=" + linkman + ", linkmanPhone=" + linkmanPhone + ", status=" + status
				+ ", busiPphone=" + busiPphone + ", deliPphone=" + deliPphone + ", makePphone=" + makePphone + "]";
	}
	
}