package egovframework.example.sample.service;


public class BoardModel {
	
private int rownum;
	
	// Id Id
    private int id;

    // 이름 이름
    private String name;

    // 영문이름 영문이름
    private String engName;

    // 이메일 이메일
    private String email;

    // 이메일수신동의 이메일수신동의 ( Y:동의 / N:거부 )
    private String emailAgree;

    // 서신할당알림메일수신허용 서신할당알림메일수신허용 ( Y:동의 / N:거부 )
    private String letterAgree;

    // 생년월일 생년월일
    private String birth;

    // 양력음력 양력음력 ( Y:양력 / N:음력 )
    private String solarLunar;

    // 직업 직업
    private String job;

    // 주소 주소
    private String adress;

    // 주소정보동의 주소정보동의 ( Y:동의 / N:거부 )
    private String adressCheck;

    // 이미지 오리지널이름 이미지 오리지널이름
    private String fileName;

    // 이미지 이름 이미지 이름
    private String fileOriName;

    // 지원입사동기 지원입사동기
    private String contents;

    // 등록자 등록자
    private String regP;

    // 등록일자 등록일자
    private String regdate;

    // 수정자 수정자
    private String updateP;

    // 수정일자 수정일자
    private String updateDate;

    // 담당직원 담당직원 ( 1:김직원 / 2:박직원 / 3:최직원)
    private String emp;

    // 유형구분 유형구분
    private String type;

    // 봉사단계 봉사단계 ( 1:새싹 / 2:열매 )
    private String volunteerStep;

    // 미번역서신수 미번역서신수
    private Integer noLetterCnt;

    // 번역구분 번역구분 ( 1:모두 / 2:아동서신 / 3:후원자서신)
    private String translation;

    // 패널티구분/일자 패널티구분/일자
    private String penalty;
    
    //휴대폰 번호
    private String phoneNum;
    
    //멤버 아이디
    private String mberId;
    
    //파일이 저장될 경로
    private String fileUrl;

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailAgree() {
		return emailAgree;
	}

	public void setEmailAgree(String emailAgree) {
		this.emailAgree = emailAgree;
	}

	public String getLetterAgree() {
		return letterAgree;
	}

	public void setLetterAgree(String letterAgree) {
		this.letterAgree = letterAgree;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSolarLunar() {
		return solarLunar;
	}

	public void setSolarLunar(String solarLunar) {
		this.solarLunar = solarLunar;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getAdressCheck() {
		return adressCheck;
	}

	public void setAdressCheck(String adressCheck) {
		this.adressCheck = adressCheck;
	}

	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileOriName() {
		return fileOriName;
	}

	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegP() {
		return regP;
	}

	public void setRegP(String regP) {
		this.regP = regP;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUpdateP() {
		return updateP;
	}

	public void setUpdateP(String updateP) {
		this.updateP = updateP;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getEmp() {
		return emp;
	}

	public void setEmp(String emp) {
		this.emp = emp;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVolunteerStep() {
		return volunteerStep;
	}

	public void setVolunteerStep(String volunteerStep) {
		this.volunteerStep = volunteerStep;
	}

	public Integer getNoLetterCnt() {
		return noLetterCnt;
	}

	public void setNoLetterCnt(Integer noLetterCnt) {
		this.noLetterCnt = noLetterCnt;
	}

	public String getTranslation() {
		return translation;
	}

	public void setTranslation(String translation) {
		this.translation = translation;
	}

	public String getPenalty() {
		return penalty;
	}

	public void setPenalty(String penalty) {
		this.penalty = penalty;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getMberId() {
		return mberId;
	}

	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

}
