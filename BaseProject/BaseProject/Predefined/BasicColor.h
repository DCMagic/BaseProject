//
//  BasicColor.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#ifndef BasicColor_h
#define BasicColor_h


#define     HexAColor(color, a)         [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:a]

#define     HexColor(color)             [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:1.0]

/****************以下为全部颜色值***********************/

// 主题颜色
#define kThemeColor kFFD01815
// 分割线颜色
#define kLineColor kFFDDDDDD
// 背景颜色
#define kBackgColor kFFF5F5F5
#define kFF666666 HexColor(0xFF666666)
// 副文本颜色
#define k66DDDDDD HexColor(0x66DDDDDD)
#define kFF30353D HexColor(0xFF30353D)


/// 所有颜色

#define kFF242B3E HexColor(0xFF242B3E)

#define kFFA2A2A2 HexColor(0xFFA2A2A2)
#define kFFCE1D20 HexColor(0xFFCE1D20)
#define kFFD01815 HexColor(0xFFD01815)
#define kFF333333 HexColor(0xFF333333)
#define kFF999999 HexColor(0xFF999999)
#define kFFDDDDDD HexColor(0xFFDDDDDD)
#define kFFDDDDDD_05 HexAColor(0xFFDDDDDD, 0.5)
#define kFFBBBBBB HexColor(0xFFBBBBBB)
#define k00000000_01 HexAColor(0x00000000, 0.05)
#define k00000000_075 HexAColor(0x00000000, 0.75)
#define k00000000_0 HexAColor(0x00000000, 0)
#define kFFF5F5F5 HexColor(0xFFF5F5F5)
#define kFFF53F3F HexColor(0xFFF53F3F)
#define kFFD01815 HexColor(0xFFD01815)
#define kFFD7DBF0 HexColor(0xFFD7DBF0)
#define kFFDC837F HexColor(0xFFDC837F)
#define kFF0281E6 HexColor(0xFF0281E6)
#define kFF0CBE84 HexColor(0xFF0CBE84)
#define kFF1677FF HexColor(0xFF1677FF)
#define kFF5C5C5C HexColor(0xFF5C5C5C)
#define kFFFFF3F2 HexColor(0xFFFFF3F2)
#define kFF747474 HexColor(0xFF747474)
#define kFFD8D8D8 HexColor(0xFFD8D8D8)
#define kFF898989 HexColor(0xFF898989)
#define kFF848B98 HexColor(0xFF848B98)
#define kFF595959 HexColor(0xFF595959)
#define kFF9C9C9C HexColor(0xFF9C9C9C)
#define kFFE11000 HexColor(0xFFE11000)
#define kFFF6B7B2 HexColor(0xFFF6B7B2)
#define kFFEBEBEB HexColor(0xFFEBEBEB)
#define kFF929292 HexColor(0xFF929292)
#define kFF95A0B0 HexColor(0xFF95A0B0)
#define kFFBFBFBF HexColor(0xFFBFBFBF)
#define kFFB9B9B9 HexColor(0xFFB9B9B9)
#define kFF9D0C0A HexColor(0xFF9D0C0A)
#define kFF7B7B7B HexColor(0xFF7B7B7B)
#define kFFFF6010 HexColor(0xFFFF6010)
#define kFFC1C1C1 HexColor(0xFFC1C1C1)
#define kFFCCCCCC HexColor(0xFFCCCCCC)
#define kFFF1F1F1 HexColor(0xFFF1F1F1)
#define kFFF1F3F8 HexColor(0xFFF1F3F8)
#define kFF355AC5 HexColor(0xFF355AC5)
#define kFF394153 HexColor(0xFF394153)
#define kFFECECEC HexColor(0xFFECECEC)
#define kFFF8F8F8 HexColor(0xFFF8F8F8)
#define kFFF8F9FF HexColor(0xFFF8F9FF)
#define kFFC5C5C5 HexColor(0xFFC5C5C5)
#define kCCE75A50 HexColor(0xCCE75A50)
#define kFFCC391F HexColor(0xFFCC391F)
#define kFFFFF3F2 HexColor(0xFFFFF3F2)
#define kFFFFFFFF HexColor(0xFFFFFFFF)
#define kFF6C7C9D HexColor(0xFF6C7C9D)
#define kFF6B737D HexColor(0xFF6B737D)
#define kFF3F3F3F HexColor(0xFF3F3F3F)
#define kFFFF3B30 HexColor(0xFFFF3B30)
#define kFFFFEAEA HexColor(0xFFFFEAEA)
#define kFFF4F5FA HexColor(0xFFF4F5FA)
#define kFFFFF9ED HexColor(0xFFFFF9ED)
#define kFFE6EAFF HexColor(0xFFE6EAFF)
#define kFFFFECE3 HexColor(0xFFFFECE3)
#define kFFE3E6F8 HexColor(0xFFE3E6F8)
#define kFFFFEFEF HexColor(0xFFFFEFEF)
#define kFFEAF0F7 HexColor(0xFFEAF0F7)
#define kFFAEB3C2 HexColor(0xFFAEB3C2)
#define kFFADB3C4 HexColor(0xFFADB3C4)
#define kFFF4F5F8 HexColor(0xFFF4F5F8)
#define kFFF4F8FB HexColor(0xFFF4F8FB)
#define kFFF49900 HexColor(0xFFF49900)
#define kFF5065DE HexColor(0xFF5065DE)
#define kFF5091DE HexColor(0xFF5091DE)
#define kFF50DEAF HexColor(0xFF50DEAF)
#define kFFDEAB50 HexColor(0xFFDEAB50)
#define kFF50C7DE HexColor(0xFF50C7DE)
#define kFFB4D0FC HexColor(0xFFB4D0FC)
#define kFF5055DE HexColor(0xFF5055DE)
#define kFFDE5050 HexColor(0xFFDE5050)
#define kFFDE5350 HexColor(0xFFDE5350)
#define kFF4055CE HexColor(0xFF4055CE)
#define kFF4E5969 HexColor(0xFF4E5969)
#define kFF30353D HexColor(0xFF30353D)
#define KFFE5E5E5 HexColor(0xFFE5E5E5)
#define KFFE5E5E5 HexColor(0xFFE5E5E5)
#define KFFE5E6EB HexColor(0xFFE5E6EB)
#define KFFBA0800 HexColor(0xFFBA0800)
#define KFF1677FF HexColor(0xFF1677FF)
#define KFF1C2331 HexColor(0xFF1C2331)
#define KFF86909C HexColor(0xFF86909C)

#define KFFEEEEEE HexColor(0xFFEEEEEE)

#define kFF949494 HexColor(0xFF949494)
#define kFF94BFFF HexColor(0xFF94BFFF)
#define kFFE48C8E HexColor(0xFFE48C8E)
#define kFFC60000 HexColor(0xFFC60000)
#define kFF787878 HexColor(0xFF787878)
#define kFFCE1B21 HexColor(0xFFCE1B21)
#define kFFF7363A HexColor(0xFFF7363A)
#define kFFF7F8FA HexColor(0xFFF7F8FA)


#define k0xFFD01815 0xFFD01815
#define k0xFFFFEAEA 0xFFFFEAEA

#define k0xFFFFFFFF 0xFFFFFFFF

#define k0xFF0281E6 0xFF0281E6
#define k0xFFEEF7FF 0xFFEEF7FF

#define kFFF67600 HexColor(0xFFF67600)


// 故障反馈列表状态颜色
#define kFFE7F1FF HexColor(0xFFE7F1FF)
#define kFF1677FF HexColor(0xFF1677FF)
#define kFFD4FFF1 HexColor(0xFFD4FFF1)
#define kFF00B578 HexColor(0xFF00B578)
#define kFFFFECE3 HexColor(0xFFFFECE3)
#define kFFFF6010 HexColor(0xFFFF6010)
#define KFF1C2331 HexColor(0xFF1C2331) //标题黑色
#define kFFDE5050 HexColor(0xFFDE5050) //必填红色
#define kFF1677FF HexColor(0xFF1677FF) //类型选中蓝色
#define kFFF2F3F5 HexColor(0xFFF2F3F5) //类型未选灰色
#define kFF4E5969 HexColor(0xFF4E5969) //类型未选字体黑色
#define kFFC9CDD4 HexColor(0xFFC9CDD4) //文本输入框borderColor




#endif /* BasicColor_h */
