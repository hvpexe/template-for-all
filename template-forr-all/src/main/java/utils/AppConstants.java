/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author LamVo
 */
public class AppConstants {

    public class DispatchFeaturess {

        public static final String LOGIN_PAGE = "";
        //...
    }

    public class LoginFeatures {

        public static final String INVALID_PAGE = "loginPage";
        public static final String DISCOVER_PAGE = "displayDiscoverPage";
    }

    public class DisplayDiscoverFeature {

        public static final String DISCOVER_PAGE = "discoverPage";

    }

    public class SearchFeatures {

        public static final String SEARCH_PAGE = "searchPage";
    }

    public class DisplayTemplateDetailFeature {

        public static final String TEMPLATE_PAGE = "productPage";
    }
    public class DisplayMyLibraryFeature {
        public static final String LIBRARY_PAGE = "myLibraryPage";
    }

    public class BuyTemplateControllerFeature {

        public static final String SUCCESS = "<div class=\"text p-4 fw-bold raleway text-success\">"
                + "Đơn Thanh Toán Đã Được Duyệt"
                + "</div>";
        public static final String FAILED = "<div class=\"text p-4 fw-bold raleway text-danger\">"
                + "Đơn Thanh Toán Xử Lí Không Thành Công"
                + "</div>";
        public static final String FAILED_INSUFFICIENT_MONEY= "<div class=\"text\">Bạn Không Đủ Tiền</div>";
    }

}
