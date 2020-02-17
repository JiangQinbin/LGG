/*     */ package lgg.upload.service;
/*     */ 
/*     */ import java.awt.BasicStroke;
/*     */ import java.awt.Color;
/*     */ import java.awt.Font;
/*     */ import java.awt.Graphics;
/*     */ import java.awt.Graphics2D;
/*     */ import java.awt.geom.AffineTransform;
/*     */ import java.awt.geom.Line2D;
/*     */ import java.awt.geom.Line2D.Double;
/*     */ import java.awt.image.BufferedImage;
/*     */ import java.util.Random;

import org.springframework.stereotype.Service;
/*     */ 
/*     */ @Service
/*     */ public class ImageUtils
/*     */ {
/*     */   private static String code;
/*     */   
/*     */   public static String getCode()
/*     */   {
/*  21 */     return code;
/*     */   }
/*     */   
/*     */   public static BufferedImage createImage(int width, int height, int n)
/*     */   {
/*  26 */     BufferedImage image = new BufferedImage(width, height, 1);
/*  27 */     Graphics g = image.getGraphics();
/*  28 */     g.setColor(Color.WHITE);
/*  29 */     g.fillRect(0, 0, width, height);
/*  30 */     g.setColor(Color.BLACK);
/*  31 */     char[] element = "123456789abcdefghijklmnopqrstuvwxyz".toCharArray();
/*  32 */     String checkcode = "";
/*  33 */     Random random = new Random();
/*  34 */     for (int i = 0; i < n; i++) {
/*  35 */       int randomIndex = Math.abs(random.nextInt()) % element.length;
/*  36 */       checkcode = checkcode + element[randomIndex];
/*     */     }
/*  38 */     g.drawString(checkcode, 10, 16);
/*  39 */     code = checkcode;
/*  40 */     return image;
/*     */   }
/*     */   
/*  43 */   public static BufferedImage createMulImage(int width, int height) { BufferedImage image = new BufferedImage(width, height, 1);
/*  44 */     Graphics g = image.getGraphics();
/*  45 */     Graphics2D g2d = (Graphics2D)g;
/*  46 */     Random random = new Random();
/*  47 */     Font mFont = new Font("黑体", 1, 24);
/*  48 */     g.setColor(getRandColor(200, 250));
/*  49 */     g.fillRect(0, 0, width, height);
/*  50 */     g.setFont(mFont);
/*  51 */     g.setColor(getRandColor(180, 200));
/*  52 */     for (int i = 0; i < 100; i++) {
/*  53 */       int x = random.nextInt(width - 1);
/*  54 */       int y = random.nextInt(height - 1);
/*  55 */       int x1 = random.nextInt(6) + 1;
/*  56 */       int y1 = random.nextInt(12) + 1;
/*  57 */       BasicStroke bs = new BasicStroke(2.0F, 0, 
/*  58 */         2);
/*  59 */       Line2D line = new Line2D.Double(x, y, x + x1, y + y1);
/*  60 */       g2d.setStroke(bs);
/*  61 */       g2d.draw(line);
/*     */     }
/*  63 */     String sRand = "";
/*     */     
/*  65 */     String ctmp = "";
/*  66 */     int itmp = 0;
/*  67 */     for (int i = 0; i < 4; i++) {
/*  68 */       if (random.nextInt(2) + 1 == 1) {
/*  69 */         itmp = random.nextInt(10) + 48;
/*  70 */         ctmp = String.valueOf((char)itmp);
/*     */       } else {
/*  72 */         itmp = random.nextInt(26) + 65;
/*  73 */         ctmp = String.valueOf((char)itmp);
/*     */       }
/*  75 */       sRand = sRand + ctmp;
/*  76 */       Color color = new Color(20 + random.nextInt(110), 20 + random
/*  77 */         .nextInt(110), 20 + random.nextInt(110));
/*  78 */       g.setColor(color);
/*  79 */       Graphics2D g2d_word = (Graphics2D)g;
/*  80 */       AffineTransform trans = new AffineTransform();
/*  81 */       trans.rotate(random.nextInt(45) * 3.14D / 180.0D, 15 * i + 8, 7.0D);
/*  82 */       float scaleSize = random.nextFloat() + 0.8F;
/*  83 */       if (scaleSize > 1.0F) scaleSize = 1.0F;
/*  84 */       trans.scale(scaleSize, scaleSize);
/*  85 */       g2d_word.setTransform(trans);
/*  86 */       g.drawString(ctmp, 15 * i + 18, 14);
/*     */     }
/*     */     
/*     */ 
/*  90 */     code = sRand;
/*  91 */     return image;
/*     */   }
/*     */   
/*     */   public static Color getRandColor(int s, int e) {
/*  95 */     Random random = new Random();
/*  96 */     if (s > 255) s = 255;
/*  97 */     if (e > 255) e = 255;
/*  98 */     int r = s + random.nextInt(e - s);
/*  99 */     int g = s + random.nextInt(e - s);
/* 100 */     int b = s + random.nextInt(e - s);
/* 101 */     return new Color(r, g, b);
/*     */   }
/*     */ }


/* Location:              F:\jiang\WEB-INF\classes\!\dingcengjiekou\ImageUtils.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */