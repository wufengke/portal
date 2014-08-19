package com.cyou.course.model;

import java.io.Serializable;

public class OutlineJsonModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private OutlineModel outline;
	
	public OutlineModel getOutline() {
		return outline;
	}
	public void setOutline(OutlineModel outline) {
		this.outline = outline;
	}
}
