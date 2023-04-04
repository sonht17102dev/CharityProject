<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
 <!-- partner_start  -->
    <div class="section-top-border">
        <div class="row">
            <div class="col-lg-9 col-md-8 companion_partners">
                <h2 class="text text-center deep-pink" >Các đối tác đồng hành</h2>
                <div class="row">
                <c:forEach items="${listPartner}" var="o">
                    <div class="col-md-6 our-partner-page" >
                        <div>
                            <img src="${o.partner_logo}">
                        </div>
                        <div class="single-defination ">
                            <h4 class="mb-20 deep-pink" >${o.partner_name}</h4>
                            <p>${o.partner_slogan}</p>
                            <p><a href="doi-tac-chi-tiet?id=${o.partner_id}">Xem chi tiết >></a></p>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="donate_now_btn text-center">
                            
                            <a href="#" class="boxed-btn4">Xem thêm >></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-sm-30 sidebar_right">
                
                <div class="single-element-widget ">
                    <h2 class="mb-30 deep-pink">Hoàn cảnh quyên góp mới nhất</h2>
                    <div class="causes_content">
                        <div class="img-cause">
                            <img src="img/causes/ong-Chuong-covid.jpg">  
                            <p>Chung tay hỗ trợ chi phí giúp ông Chương hồi phục sức khỏe sau đại dịch covid-19</p>
                        </div>
                        <div class="balance d-flex justify-content-between align-items-center">
                            <span>4.377.296đ quyên góp / 30.000.000đ </span>
                        </div>
                        <div class="custom_progress_bar">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 20%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                                </div>
                              </div>
                        </div>
                        
                        <div class="infomation text-center">
                            <ul>
                                <li>Lượt quyên góp <br><span>132</span></li>
                                <li>Đạt được <br><span>14.59%</span></li>
                                <li>Thời gian còn <br>37 Ngày<span></span> </li>
                                
                            </ul>
                        </div>
                        <div class="">
                            <a href="#" class="btn-Donate-sidebar">Quyên góp</a>
                        </div>
                        <div class="horizontal_line"> </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <!-- partner_end  -->