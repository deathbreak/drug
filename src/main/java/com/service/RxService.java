package com.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Json;
import com.bean.Rxdrug;
import com.bean.Rxperson;
import com.bean.RxpersonJson;
import com.mapper.RxdrugMapper;
import com.mapper.RxpersonMapper;
import com.utils.Boolean_tiaoxingma;

@Service
public class RxService {

    @Autowired
    RxdrugMapper rdm;

    @Autowired
    RxpersonMapper rpm;

    public List<Json> GetOverTime() {
        List<String> itstr = rdm.GetAllOverTime();
        if (itstr.size() == 0) {
            return null;
        } else {
            int len = itstr.size();
            List<Json> re = new ArrayList<Json>();
            //StringBuffer forappend = new StringBuffer("");
            for (int ii = 0; ii < len; ii++) {
                StringBuffer forappend = new StringBuffer("");
                List<Rxdrug> RD = rdm.GetIt(itstr.get(ii));
                for (Rxdrug rxdrug : RD) {
                    forappend.append(rxdrug.getDrugname() + ",");
                }

                re.add(new Json(itstr.get(ii), forappend.toString(), null, null, null, 0));
            }
            Collections.reverse(re);
            return re;
        }

    }

    public Rxperson GetTimeRxpService(String time) {
        List<Rxperson> check = rpm.GetByTime(time);
        if (check.size() == 0) {
            return null;
        } else {
            return check.get(0);
        }
    }


    public void AddRxPService(Rxperson rx) {
        List<Rxperson> check = rpm.GetByTime(rx.getTime());
        if (check.size() == 0) {
            rpm.AddRxperson(rx);
        }
    }

    public List<RxpersonJson> GetCompleteInfoService() {
        List<String> str = rpm.GetequalsTime();
        if (str.size() == 0) {
            return null;
        } else {
            List<RxpersonJson> re = new ArrayList<RxpersonJson>();
            for (String s : str) {
                re.add(new RxpersonJson(rpm.GetByTime(s), rdm.GetIt(s)));
            }
            Collections.reverse(re);
            return re;
        }
    }

    public List<RxpersonJson> QueryRxService(String queryrx) {
        if (queryrx.equals("")) {
            return GetCompleteInfoService();
        } else {
            if (Boolean_tiaoxingma.Checkdate(queryrx)) {
                List<String> str = rpm.GetDateTime(queryrx);
                if (str.size() == 0) {
                    return null;
                } else {
                    List<RxpersonJson> re = new ArrayList<RxpersonJson>();
                    for (String s : str) {
                        re.add(new RxpersonJson(rpm.GetByTime(s), rdm.GetIt(s)));
                    }
                    return re;
                }
            } else {
                List<String> str2 = rdm.GetSomeDrugTime(queryrx);
                if (str2.size() == 0) {
                    return null;
                } else {
                    List<RxpersonJson> re2 = new ArrayList<RxpersonJson>();
                    for (String s : str2) {
                        re2.add(new RxpersonJson(rpm.GetByTime(s), rdm.GetIt(s)));
                    }
                    return re2;
                }
            }
        }
    }

    public void UpdateRxService(Rxperson rx) {
        rpm.UpdateRxp(rx);
    }

    public void DelRxService(String del) {
        rdm.DelRxdrug(del);
        rpm.DelRxp(del);
    }

}
