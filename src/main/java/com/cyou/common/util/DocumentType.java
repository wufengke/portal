package com.cyou.common.util;

public enum DocumentType {
	
	GOVID(1,"Government-issued identification"),DRIVERLICENSE(2,"Driver’s license"),PASSPORT(3,"Passport information page"),NATIONCARD(4,"National identification card"),STATEID(5,"State-issued identification"),PERMANENT(6,"Permanent residence card"),DIFFERENT(7,"A different form of government-issued identification");
	
	private int documetnTypeId;
	private String documentType;
	
	
	private DocumentType(int documentTypeId,String documentType){
		this.documetnTypeId = documentTypeId;
		this.documentType = documentType;
	}

	public int getDocumentTypeId() {
		return documetnTypeId;
	}

	public void setDocumentTypeId(int documetnTypeId) {
		this.documetnTypeId = documetnTypeId;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}
	
	

}
