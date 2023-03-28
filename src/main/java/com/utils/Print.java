package com.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.Book;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.bean.Sell;


public class Print implements Printable {
    private static String TITLE;//标题
    private static String ORDERNO;//单号
    private static String STORENAME;//门店
    private static String CASHIER;//收银员
    private static String CASH;//总现金
    private static String PAYMENT;//支付方式
    private static String USERNAME;//会员名称
    private static String TEL;//客服电话
    private static String ADDRESS;//地址
    private static List<Sell> Goodsinfo;


    private static void chushihua(String orderNo, String storeName, String cashier, String cash, String payment, String userName, String tel, String address, List<Sell> goodsinfo) {
        TITLE = "收银小票";
        ORDERNO = orderNo;
        STORENAME = storeName;
        CASHIER = cashier;
        CASH = cash;
        PAYMENT = payment;
        USERNAME = userName;
        TEL = tel;
        ADDRESS = address;
        Goodsinfo = goodsinfo;

    }

    /**
     * 用于将商品零售进行进行打印
     */
    public void printSheet(String orderNo, String storeName, String cashier, String cash, String payment, String userName, String tel, String address, List<Sell> Goodsinfo) {
        chushihua(orderNo, storeName, cashier, cash, payment, userName, tel, address, Goodsinfo);
        // 通俗理解就是书、文档
        Book book = new Book();
        // 设置成竖打
        PageFormat pf = new PageFormat();
        pf.setOrientation(PageFormat.PORTRAIT); //LANDSCAPE表示横打;PORTRAIT表示竖打;REVERSE_LANDSCAPE表示打印空白
        // 通过Paper设置页面的空白边距和可打印区域。必须与实际打印纸张大小相符。
        Paper p = new Paper();
        int length = printSize(Goodsinfo);//加值参数为115，增加行数需要增加高度
        System.out.println("Paper length is:" + length);
        p.setSize(165, length); // 纸张大小A4纸(595, 842),经测试58mm为165
        p.setImageableArea(5, 5, 155, length); //设置打印区域，A4纸的默认X,Y边距是72
        //x - 用来设置此 paper 可成像区域左上角的 x 坐标
        //y - 用来设置此 paper 可成像区域左上角的 y 坐标
        //width - 用来设置此 paper 可成像区域宽度的值
        //height - 用来设置此 paper 可成像区域高度的值
        pf.setPaper(p);
        // 把 PageFormat 和 Printable 添加到书中，组成一个页面
        book.append(new Print(), pf);
        // 获取打印服务对象
        PrinterJob job = PrinterJob.getPrinterJob();
        // 设置打印类
        job.setPageable(book);
        try {
            // // 可以用printDialog显示打印对话框，在用户确认后打印；也可以直接打印
            // if (a) {
            job.print();
            // }
        } catch (PrinterException e) {
            e.printStackTrace();
        }
    }

    public static Integer printSize(List<Sell> goodsArray) {
        int height = 200;//加值参数为140，增加行数需要增加高度
        if (goodsArray.size() > 0) {
            height += goodsArray.size() * 10;
            for (int i = 0; i < goodsArray.size(); i++) {
                goodsArray.get(i).getDrugname();
                //String[] goods = goodsArray[i].split(",");
                if (goodsArray.get(i).getDrugname().length() > 8) {//名称超11个字,换行
                    height += 10;
                }
            }
        }
        return height;
    }


    public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
        try {
            /**
             * * @param Graphic指明打印的图形环境
             * PageFormat指明打印页格式（页面大小以点为计量单位，
             * 1点为1英寸的1/72，1英寸为25.4毫米。A4纸大致为595×842点） *
             * @param pageIndex指明页号
             **/
            // 转换成Graphics2D
            Graphics2D g2d = (Graphics2D) graphics;
            // 设置打印颜色为黑色
            g2d.setColor(Color.black);
            // 打印起点坐标
            switch (pageIndex) {
                case 0:
                    String xuxian = "------------------------------------";
                    double x = pageFormat.getImageableX();
                    double y = pageFormat.getImageableY() + 10;
                    //设置打印字体（字体名称、样式和点大小）（字体名称可以是物理或者逻辑名称）
                    Font fontTitle = new Font("新宋体", Font.BOLD, 10);
                    g2d.setFont(fontTitle); // 设置字体
                    //打印标题
                    g2d.drawString(TITLE, (float) x + 40, (float) y);
                    y += fontTitle.getSize2D() + 4;

                    Font fontContent = new Font("新宋体", Font.PLAIN, 7);
                    g2d.setFont(fontContent); //设置字体
                    //打印 订单号
                    g2d.drawString("单号：" + ORDERNO, (float) x, (float) y);
                    y += fontContent.getSize2D() + 4;
                    g2d.drawString("门店：" + STORENAME, (float) x, (float) y);
                    y += fontContent.getSize2D() + 4;
                    g2d.drawString("收银员：" + CASHIER, (float) x, (float) y);
                    y += fontContent.getSize2D() + 4;
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    g2d.drawString("时间：" + format.format(new Date()), (float) x, (float) y);
                    y += fontContent.getSize2D() + 4;

                    g2d.drawString(xuxian, (float) x, (float) y);
                    y += fontContent.getSize2D() + 2;

                    g2d.drawString("名称", (float) x, (float) y);
                    g2d.drawString("数", (float) x + 70, (float) y);
                    //g2d.drawString("积分单", (float) x + 80, (float) y);
                    g2d.drawString("现金单", (float) x + 110, (float) y);
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString("量", (float) x + 70, (float) y);
                    //g2d.drawString("价", (float) x + 80, (float) y);
                    g2d.drawString("价", (float) x + 110, (float) y);
                    y += fontContent.getSize2D() + 2;
                    @SuppressWarnings("unused")
                    Double totalCount = 0.0, totalPrice = 0.0;

                    for (int i = 0; i < Goodsinfo.size(); i++) {
                        //String[] goods = GOODSARRAY[i].split(",");

                        totalCount += Double.valueOf(Goodsinfo.get(i).getCount());
                        //totalPrice += Double.valueOf(GOODSARRAY.get(i).getCount())*Double.valueOf(GOODSARRAY.get(i).get);
                        String goodsName = Goodsinfo.get(i).getDrugname().length() > 8 ? Goodsinfo.get(i).getDrugname().substring(0, 8) : Goodsinfo.get(i).getDrugname();
                        g2d.drawString((i + 1) + "." + goodsName, (float) x, (float) y);
                        if (Goodsinfo.get(i).getDrugname().length() > 8) {//名称超8个字,换行
                            y += fontContent.getSize2D() + 2;
                            g2d.drawString(Goodsinfo.get(i).getDrugname().substring(8), (float) x + 7, (float) y);
                        }
                        if (Goodsinfo.get(i).getDrugname().length() > 20) {
                            y += fontContent.getSize2D() + 2;
                        }
                        g2d.drawString(Goodsinfo.get(i).getAmount().toString(), (float) x + 70, (float) y);
                        //g2d.drawString(Goodsinfo.get(i).getJifen().toString(), (float) x + 80, (float) y);
                        g2d.drawString(Goodsinfo.get(i).getPrice().toString(), (float) x + 110, (float) y);
                        y += fontContent.getSize2D() + 2;
                    }
                    g2d.drawString(xuxian, (float) x, (float) y);
                    y += fontContent.getSize2D() + 2;
					/*g2d.drawString("件数："+totalCount, (float) x , (float) y);
					y += fontContent.getSize2D()+2;*/
					/*g2d.drawString("积分总计："+ String.format("%.2f",Double.valueOf(INTEGRAL)), (float) x ,(float) y);
					y += fontContent.getSize2D()+2;*/
                    g2d.drawString("现金总计：" + String.format("%.2f", Double.valueOf(CASH)), (float) x, (float) y);
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString("支付方式：" + PAYMENT, (float) x, (float) y);
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString("会员名称：" + USERNAME, (float) x, (float) y);
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString(xuxian, (float) x, (float) y);
                    y += fontContent.getSize2D() + 4;
                    String address = ADDRESS.length() > 16 ? ADDRESS.substring(0, 16) : ADDRESS;
                    g2d.drawString("地址：" + address, (float) x, (float) y);
                    if (ADDRESS.length() > 16) {
                        y += fontContent.getSize2D() + 2;
                        g2d.drawString(ADDRESS.substring(16), (float) x + 20, (float) y);
                    }
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString("谢谢惠顾,祝您早日康复!!!", (float) x + 22, (float) y);
                    y += fontContent.getSize2D() + 2;
                    g2d.drawString("客服电话(" + TEL + ")", (float) x + 25, (float) y);
                    y += fontContent.getSize2D() + 10;
                    return PAGE_EXISTS;
                default:
                    return NO_SUCH_PAGE;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}

