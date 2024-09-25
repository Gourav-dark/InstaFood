; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [228 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [456 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 170
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 169
	i32 23253790, ; 2: InstaFood.PhoneApp => 0x162d31e => 132
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 86
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 213
	i32 66541672, ; 5: System.Diagnostics.StackTrace => 0x3f75868 => 149
	i32 67008169, ; 6: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 7: System.Security.Cryptography.Primitives => 0x410f24b => 202
	i32 72070932, ; 8: Microsoft.Maui.Graphics.dll => 0x44bb714 => 84
	i32 82292897, ; 9: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 187
	i32 98325684, ; 10: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 60
	i32 117431740, ; 11: System.Runtime.InteropServices => 0x6ffddbc => 189
	i32 122350210, ; 12: System.Threading.Channels.dll => 0x74aea82 => 211
	i32 142721839, ; 13: System.Net.WebHeaderCollection => 0x881c32f => 177
	i32 149972175, ; 14: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 202
	i32 159306688, ; 15: System.ComponentModel.Annotations => 0x97ed3c0 => 141
	i32 165246403, ; 16: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 104
	i32 182336117, ; 17: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 123
	i32 195452805, ; 18: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 19: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 20: System.ComponentModel => 0xc38ff48 => 144
	i32 209399409, ; 21: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 102
	i32 221958352, ; 22: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 59
	i32 230752869, ; 23: Microsoft.CSharp.dll => 0xdc10265 => 133
	i32 231409092, ; 24: System.Linq.Parallel => 0xdcb05c4 => 163
	i32 244348769, ; 25: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 41
	i32 246610117, ; 26: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 185
	i32 254259026, ; 27: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 40
	i32 280992041, ; 28: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 291275502, ; 29: Microsoft.Extensions.Http.dll => 0x115c82ee => 66
	i32 317674968, ; 30: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 31: Xamarin.AndroidX.Activity.dll => 0x13031348 => 99
	i32 330147069, ; 32: Microsoft.SqlServer.Server => 0x13ada4fd => 85
	i32 336156722, ; 33: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 34: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 111
	i32 356389973, ; 35: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 367780167, ; 36: System.IO.Pipes => 0x15ebe147 => 161
	i32 374914964, ; 37: System.Transactions.Local => 0x1658bf94 => 216
	i32 375677976, ; 38: System.Net.ServicePoint.dll => 0x16646418 => 174
	i32 379916513, ; 39: System.Threading.Thread.dll => 0x16a510e1 => 213
	i32 385762202, ; 40: System.Memory.dll => 0x16fe439a => 166
	i32 392610295, ; 41: System.Threading.ThreadPool.dll => 0x1766c1f7 => 214
	i32 395744057, ; 42: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 43: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 44: System.Collections => 0x1a61054f => 140
	i32 450948140, ; 45: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 110
	i32 451504562, ; 46: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 203
	i32 459347974, ; 47: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 194
	i32 465846621, ; 48: mscorlib => 0x1bc4415d => 222
	i32 469710990, ; 49: System.dll => 0x1bff388e => 221
	i32 485463106, ; 50: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 73
	i32 498788369, ; 51: System.ObjectModel => 0x1dbae811 => 179
	i32 500358224, ; 52: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 53: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 54: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 70
	i32 530272170, ; 55: System.Linq.Queryable => 0x1f9b4faa => 164
	i32 539058512, ; 56: Microsoft.Extensions.Logging => 0x20216150 => 67
	i32 540030774, ; 57: System.IO.FileSystem.dll => 0x20303736 => 159
	i32 546455878, ; 58: System.Runtime.Serialization.Xml => 0x20924146 => 195
	i32 548916678, ; 59: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 47
	i32 568424432, ; 60: NuGet.Common.dll => 0x21e177f0 => 87
	i32 571435654, ; 61: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 63
	i32 577335427, ; 62: System.Security.Cryptography.Cng => 0x22697083 => 200
	i32 592146354, ; 63: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 613668793, ; 64: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 199
	i32 614348080, ; 65: InstaFood.PhoneApp.dll => 0x249e3530 => 132
	i32 627609679, ; 66: Xamarin.AndroidX.CustomView => 0x2568904f => 108
	i32 627931235, ; 67: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 68: System.Text.Encodings.Web.dll => 0x27787397 => 208
	i32 672442732, ; 69: System.Collections.Concurrent => 0x2814a96c => 136
	i32 683518922, ; 70: System.Net.Security => 0x28bdabca => 173
	i32 688181140, ; 71: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 72: System.Xml.Linq.dll => 0x29293ff5 => 217
	i32 706645707, ; 73: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709152836, ; 74: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 97
	i32 709557578, ; 75: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 76: System.Runtime.Loader.dll => 0x2b15ed29 => 190
	i32 759454413, ; 77: System.Net.Requests => 0x2d445acd => 172
	i32 762598435, ; 78: System.IO.Pipes.dll => 0x2d745423 => 161
	i32 775507847, ; 79: System.IO.Compression => 0x2e394f87 => 156
	i32 777317022, ; 80: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 81: Microsoft.Extensions.Options => 0x2f0980eb => 69
	i32 804008546, ; 82: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 45
	i32 804715423, ; 83: System.Data.Common => 0x2ff6fb9f => 146
	i32 823281589, ; 84: System.Private.Uri.dll => 0x311247b5 => 181
	i32 830298997, ; 85: System.IO.Compression.Brotli => 0x317d5b75 => 155
	i32 878954865, ; 86: System.Net.Http.Json => 0x3463c971 => 167
	i32 904024072, ; 87: System.ComponentModel.Primitives.dll => 0x35e25008 => 142
	i32 911108515, ; 88: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 160
	i32 926902833, ; 89: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 941753469, ; 90: NuGet.Packaging => 0x3822047d => 90
	i32 955402788, ; 91: Newtonsoft.Json => 0x38f24a24 => 86
	i32 966729478, ; 92: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 127
	i32 967690846, ; 93: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 111
	i32 975236339, ; 94: System.Diagnostics.Tracing => 0x3a20ecf3 => 151
	i32 975874589, ; 95: System.Xml.XDocument => 0x3a2aaa1d => 219
	i32 986514023, ; 96: System.Private.DataContractSerialization.dll => 0x3acd0267 => 180
	i32 992768348, ; 97: System.Collections.dll => 0x3b2c715c => 140
	i32 994442037, ; 98: System.IO.FileSystem => 0x3b45fb35 => 159
	i32 999186168, ; 99: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 65
	i32 1012816738, ; 100: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 121
	i32 1019214401, ; 101: System.Drawing => 0x3cbffa41 => 153
	i32 1028951442, ; 102: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 58
	i32 1029334545, ; 103: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 104: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 100
	i32 1036536393, ; 105: System.Drawing.Primitives.dll => 0x3dc84a49 => 152
	i32 1040658680, ; 106: InstaFood.Shared.dll => 0x3e0730f8 => 131
	i32 1044663988, ; 107: System.Linq.Expressions.dll => 0x3e444eb4 => 162
	i32 1048992957, ; 108: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 60
	i32 1052210849, ; 109: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 113
	i32 1062017875, ; 110: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 72
	i32 1082857460, ; 111: System.ComponentModel.TypeConverter => 0x408b17f4 => 143
	i32 1084122840, ; 112: Xamarin.Kotlin.StdLib => 0x409e66d8 => 128
	i32 1098259244, ; 113: System => 0x41761b2c => 221
	i32 1118262833, ; 114: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1138436374, ; 115: Microsoft.Data.SqlClient.dll => 0x43db2916 => 48
	i32 1157931901, ; 116: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 50
	i32 1168523401, ; 117: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 118: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 61
	i32 1178241025, ; 119: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 118
	i32 1202000627, ; 120: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 50
	i32 1203215381, ; 121: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 122: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 54
	i32 1208641965, ; 123: System.Diagnostics.Process => 0x480a69ad => 148
	i32 1234928153, ; 124: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 125: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 126: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 109
	i32 1309188875, ; 127: System.Private.DataContractSerialization => 0x4e08a30b => 180
	i32 1324164729, ; 128: System.Linq => 0x4eed2679 => 165
	i32 1335329327, ; 129: System.Runtime.Serialization.Json.dll => 0x4f97822f => 193
	i32 1373134921, ; 130: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 131: Xamarin.AndroidX.SavedState => 0x52114ed3 => 121
	i32 1406073936, ; 132: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 105
	i32 1408764838, ; 133: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 192
	i32 1422545099, ; 134: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 187
	i32 1430672901, ; 135: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 136: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 127
	i32 1452070440, ; 137: System.Formats.Asn1.dll => 0x568cd628 => 154
	i32 1454105418, ; 138: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 62
	i32 1458022317, ; 139: System.Net.Security.dll => 0x56e7a7ad => 173
	i32 1460893475, ; 140: System.IdentityModel.Tokens.Jwt => 0x57137723 => 94
	i32 1461004990, ; 141: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 142: System.Collections.Immutable.dll => 0x5718a9ef => 137
	i32 1462112819, ; 143: System.IO.Compression.dll => 0x57261233 => 156
	i32 1469204771, ; 144: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 101
	i32 1470490898, ; 145: Microsoft.Extensions.Primitives => 0x57a5e912 => 70
	i32 1479771757, ; 146: System.Collections.Immutable => 0x5833866d => 137
	i32 1480492111, ; 147: System.IO.Compression.Brotli.dll => 0x583e844f => 155
	i32 1487239319, ; 148: Microsoft.Win32.Primitives => 0x58a57897 => 134
	i32 1493001747, ; 149: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 150: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 74
	i32 1505131794, ; 151: Microsoft.Extensions.Http => 0x59b67d12 => 66
	i32 1514721132, ; 152: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 153: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 65
	i32 1543031311, ; 154: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 210
	i32 1546581739, ; 155: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 45
	i32 1551623176, ; 156: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1565310744, ; 157: System.Runtime.Caching => 0x5d4cbf18 => 96
	i32 1568485794, ; 158: NuGet.Versioning.dll => 0x5d7d31a2 => 92
	i32 1573704789, ; 159: System.Runtime.Serialization.Json => 0x5dccd455 => 193
	i32 1582305585, ; 160: Azure.Identity => 0x5e501131 => 36
	i32 1586881704, ; 161: NuGet.Packaging.dll => 0x5e95e4a8 => 90
	i32 1604827217, ; 162: System.Net.WebClient => 0x5fa7b851 => 176
	i32 1622152042, ; 163: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 115
	i32 1624863272, ; 164: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 125
	i32 1628113371, ; 165: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 77
	i32 1636350590, ; 166: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 107
	i32 1639515021, ; 167: System.Net.Http.dll => 0x61b9038d => 168
	i32 1639986890, ; 168: System.Text.RegularExpressions => 0x61c036ca => 210
	i32 1654881142, ; 169: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 44
	i32 1657153582, ; 170: System.Runtime => 0x62c6282e => 196
	i32 1658251792, ; 171: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 126
	i32 1677501392, ; 172: System.Net.Primitives.dll => 0x63fca3d0 => 171
	i32 1679769178, ; 173: System.Security.Cryptography => 0x641f3e5a => 204
	i32 1689493916, ; 174: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 49
	i32 1729485958, ; 175: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 103
	i32 1736233607, ; 176: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 177: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 178: System.Transactions.Local.dll => 0x67fe8db2 => 216
	i32 1750313021, ; 179: Microsoft.Win32.Primitives.dll => 0x6853a83d => 134
	i32 1760259689, ; 180: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 43
	i32 1763938596, ; 181: System.Diagnostics.TraceSource.dll => 0x69239124 => 150
	i32 1766324549, ; 182: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 123
	i32 1770582343, ; 183: Microsoft.Extensions.Logging.dll => 0x6988f147 => 67
	i32 1780572499, ; 184: Mono.Android.Runtime.dll => 0x6a216153 => 226
	i32 1782862114, ; 185: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 186: Xamarin.AndroidX.Fragment => 0x6a96652d => 110
	i32 1793755602, ; 187: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1794500907, ; 188: Microsoft.Identity.Client.dll => 0x6af5e92b => 71
	i32 1796167890, ; 189: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 47
	i32 1800714753, ; 190: InstaFood.Shared => 0x6b54ba01 => 131
	i32 1808609942, ; 191: Xamarin.AndroidX.Loader => 0x6bcd3296 => 115
	i32 1813058853, ; 192: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 128
	i32 1813201214, ; 193: Xamarin.Google.Android.Material => 0x6c13413e => 126
	i32 1818569960, ; 194: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 119
	i32 1824175904, ; 195: System.Text.Encoding.Extensions => 0x6cbab720 => 207
	i32 1824722060, ; 196: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 192
	i32 1828688058, ; 197: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 68
	i32 1840242603, ; 198: NuGet.Configuration.dll => 0x6dafdfab => 88
	i32 1842015223, ; 199: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 200: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 201: System.Linq.Expressions => 0x6ec71a65 => 162
	i32 1870277092, ; 202: System.Reflection.Primitives => 0x6f7a29e4 => 186
	i32 1871986876, ; 203: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 77
	i32 1875935024, ; 204: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 205: System.Collections.NonGeneric.dll => 0x71dc7c8b => 138
	i32 1939592360, ; 206: System.Private.Xml.Linq => 0x739bd4a8 => 182
	i32 1961813231, ; 207: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 122
	i32 1968388702, ; 208: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 55
	i32 1986222447, ; 209: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 78
	i32 2003115576, ; 210: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 211: System.Buffers.dll => 0x77ec19b4 => 135
	i32 2019465201, ; 212: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 113
	i32 2025202353, ; 213: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2040764568, ; 214: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 72
	i32 2045470958, ; 215: System.Private.Xml => 0x79eb68ee => 183
	i32 2055257422, ; 216: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 112
	i32 2066184531, ; 217: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 218: System.Diagnostics.TraceSource => 0x7b6f419e => 150
	i32 2072397586, ; 219: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 64
	i32 2079903147, ; 220: System.Runtime.dll => 0x7bf8cdab => 196
	i32 2090596640, ; 221: System.Numerics.Vectors => 0x7c9bf920 => 178
	i32 2127167465, ; 222: System.Console => 0x7ec9ffe9 => 145
	i32 2142473426, ; 223: System.Collections.Specialized => 0x7fb38cd2 => 139
	i32 2143790110, ; 224: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 220
	i32 2159891885, ; 225: Microsoft.Maui => 0x80bd55ad => 82
	i32 2169148018, ; 226: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 227: Microsoft.Extensions.Options.dll => 0x820d22b3 => 69
	i32 2192057212, ; 228: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 68
	i32 2192166651, ; 229: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 41
	i32 2193016926, ; 230: System.ObjectModel.dll => 0x82b6c85e => 179
	i32 2201107256, ; 231: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 129
	i32 2201231467, ; 232: System.Net.Http => 0x8334206b => 168
	i32 2207618523, ; 233: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 234: Microsoft.EntityFrameworkCore => 0x86487ec9 => 49
	i32 2253551641, ; 235: Microsoft.IdentityModel.Protocols => 0x86527819 => 76
	i32 2265110946, ; 236: System.Security.AccessControl.dll => 0x8702d9a2 => 197
	i32 2266799131, ; 237: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 56
	i32 2270573516, ; 238: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 239: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 120
	i32 2295906218, ; 240: System.Net.Sockets => 0x88d8bfaa => 175
	i32 2301204245, ; 241: ChilkatDotNet46.dll => 0x89299715 => 38
	i32 2303942373, ; 242: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 243: System.Private.CoreLib.dll => 0x896b7878 => 224
	i32 2340441535, ; 244: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 188
	i32 2353062107, ; 245: System.Net.Primitives => 0x8c40e0db => 171
	i32 2368005991, ; 246: System.Xml.ReaderWriter.dll => 0x8d24e767 => 218
	i32 2369706906, ; 247: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 75
	i32 2371007202, ; 248: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 55
	i32 2383496789, ; 249: System.Security.Principal.Windows.dll => 0x8e114655 => 205
	i32 2395872292, ; 250: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2400844204, ; 251: NuGet.Protocol => 0x8f19f9ac => 91
	i32 2411328690, ; 252: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 40
	i32 2427813419, ; 253: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 254: System.Console.dll => 0x912896e5 => 145
	i32 2442556106, ; 255: Microsoft.JSInterop.dll => 0x919672ca => 79
	i32 2458678730, ; 256: System.Net.Sockets.dll => 0x928c75ca => 175
	i32 2459001652, ; 257: System.Linq.Parallel.dll => 0x92916334 => 163
	i32 2471841756, ; 258: netstandard.dll => 0x93554fdc => 223
	i32 2475788418, ; 259: Java.Interop.dll => 0x93918882 => 225
	i32 2480646305, ; 260: Microsoft.Maui.Controls => 0x93dba8a1 => 80
	i32 2484371297, ; 261: System.Net.ServicePoint => 0x94147f61 => 174
	i32 2537015816, ; 262: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 39
	i32 2538310050, ; 263: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 185
	i32 2550873716, ; 264: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 265: Microsoft.CSharp => 0x98ba5a04 => 133
	i32 2570120770, ; 266: System.Text.Encodings.Web => 0x9930ee42 => 208
	i32 2585220780, ; 267: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 207
	i32 2585813321, ; 268: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 42
	i32 2589602615, ; 269: System.Threading.ThreadPool => 0x9a5a3337 => 214
	i32 2592341985, ; 270: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 61
	i32 2593496499, ; 271: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2600501332, ; 272: NuGet.Frameworks.dll => 0x9b008054 => 89
	i32 2605712449, ; 273: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 129
	i32 2617129537, ; 274: System.Private.Xml.dll => 0x9bfe3a41 => 183
	i32 2620871830, ; 275: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 107
	i32 2626831493, ; 276: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2628210652, ; 277: System.Memory.Data => 0x9ca74fdc => 95
	i32 2634653062, ; 278: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 51
	i32 2640290731, ; 279: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 75
	i32 2640706905, ; 280: Azure.Core => 0x9d65fd59 => 35
	i32 2660759594, ; 281: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 98
	i32 2661925899, ; 282: NuGet.Common => 0x9ea9c40b => 87
	i32 2663698177, ; 283: System.Runtime.Loader => 0x9ec4cf01 => 190
	i32 2664396074, ; 284: System.Xml.XDocument.dll => 0x9ecf752a => 219
	i32 2665622720, ; 285: System.Drawing.Primitives => 0x9ee22cc0 => 152
	i32 2676780864, ; 286: System.Data.Common.dll => 0x9f8c6f40 => 146
	i32 2677098746, ; 287: Azure.Identity.dll => 0x9f9148fa => 36
	i32 2686887180, ; 288: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 195
	i32 2692077919, ; 289: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 44
	i32 2717744543, ; 290: System.Security.Claims => 0xa1fd7d9f => 198
	i32 2719963679, ; 291: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 200
	i32 2724373263, ; 292: System.Runtime.Numerics.dll => 0xa262a30f => 191
	i32 2732626843, ; 293: Xamarin.AndroidX.Activity => 0xa2e0939b => 99
	i32 2735172069, ; 294: System.Threading.Channels => 0xa30769e5 => 211
	i32 2735631878, ; 295: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 39
	i32 2737747696, ; 296: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 101
	i32 2740051746, ; 297: Microsoft.Identity.Client => 0xa351df22 => 71
	i32 2752995522, ; 298: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2755098380, ; 299: Microsoft.SqlServer.Server.dll => 0xa437770c => 85
	i32 2755643133, ; 300: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 52
	i32 2758225723, ; 301: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 81
	i32 2764765095, ; 302: Microsoft.Maui.dll => 0xa4caf7a7 => 82
	i32 2765824710, ; 303: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 206
	i32 2778768386, ; 304: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 124
	i32 2785988530, ; 305: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 306: Microsoft.Maui.Graphics => 0xa7008e0b => 84
	i32 2806116107, ; 307: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 308: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 105
	i32 2819267264, ; 309: NuGet.Configuration => 0xa80a9ac0 => 88
	i32 2831556043, ; 310: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2833784645, ; 311: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 46
	i32 2847789619, ; 312: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 51
	i32 2853208004, ; 313: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 124
	i32 2861189240, ; 314: Microsoft.Maui.Essentials => 0xaa8a4878 => 83
	i32 2867946736, ; 315: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 98
	i32 2892341533, ; 316: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 43
	i32 2905242038, ; 317: mscorlib.dll => 0xad2a79b6 => 222
	i32 2909740682, ; 318: System.Private.CoreLib => 0xad6f1e8a => 224
	i32 2911054922, ; 319: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 64
	i32 2916838712, ; 320: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 125
	i32 2919462931, ; 321: System.Numerics.Vectors.dll => 0xae037813 => 178
	i32 2940926066, ; 322: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 149
	i32 2944313911, ; 323: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 93
	i32 2952707053, ; 324: NuGet.Frameworks => 0xaffebbed => 89
	i32 2959614098, ; 325: System.ComponentModel.dll => 0xb0682092 => 144
	i32 2968338931, ; 326: System.Security.Principal.Windows => 0xb0ed41f3 => 205
	i32 2972252294, ; 327: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 199
	i32 2978675010, ; 328: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 109
	i32 2987532451, ; 329: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 122
	i32 3012788804, ; 330: System.Configuration.ConfigurationManager => 0xb3938244 => 93
	i32 3020703001, ; 331: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 59
	i32 3033605958, ; 332: System.Memory.Data.dll => 0xb4d12746 => 95
	i32 3038032645, ; 333: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 334: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 116
	i32 3059408633, ; 335: Mono.Android.Runtime => 0xb65adef9 => 226
	i32 3059793426, ; 336: System.ComponentModel.Primitives => 0xb660be12 => 142
	i32 3069363400, ; 337: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 53
	i32 3077302341, ; 338: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 339: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 78
	i32 3090735792, ; 340: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 203
	i32 3099732863, ; 341: System.Security.Claims.dll => 0xb8c22b7f => 198
	i32 3103600923, ; 342: System.Formats.Asn1 => 0xb8fd311b => 154
	i32 3121463068, ; 343: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 157
	i32 3124832203, ; 344: System.Threading.Tasks.Extensions => 0xba4127cb => 212
	i32 3132293585, ; 345: System.Security.AccessControl => 0xbab301d1 => 197
	i32 3147165239, ; 346: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 151
	i32 3159123045, ; 347: System.Reflection.Primitives.dll => 0xbc4c6465 => 186
	i32 3160747431, ; 348: System.IO.MemoryMappedFiles => 0xbc652da7 => 160
	i32 3178803400, ; 349: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 117
	i32 3195844289, ; 350: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 53
	i32 3220365878, ; 351: System.Threading => 0xbff2e236 => 215
	i32 3225142516, ; 352: NuGet.Versioning => 0xc03bc4f4 => 92
	i32 3258312781, ; 353: Xamarin.AndroidX.CardView => 0xc235e84d => 103
	i32 3265493905, ; 354: System.Linq.Queryable.dll => 0xc2a37b91 => 164
	i32 3265893370, ; 355: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 212
	i32 3280506390, ; 356: System.ComponentModel.Annotations.dll => 0xc3888e16 => 141
	i32 3290767353, ; 357: System.Security.Cryptography.Encoding => 0xc4251ff9 => 201
	i32 3301621068, ; 358: InstaFood.DataAccess.dll => 0xc4cabd4c => 130
	i32 3305363605, ; 359: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 360: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 74
	i32 3316684772, ; 361: System.Net.Requests.dll => 0xc5b097e4 => 172
	i32 3317135071, ; 362: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 108
	i32 3346324047, ; 363: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 118
	i32 3357674450, ; 364: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 365: System.Text.Json => 0xc82afec1 => 209
	i32 3362522851, ; 366: Xamarin.AndroidX.Core => 0xc86c06e3 => 106
	i32 3366347497, ; 367: Java.Interop => 0xc8a662e9 => 225
	i32 3374879918, ; 368: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 76
	i32 3374999561, ; 369: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 120
	i32 3381016424, ; 370: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 371: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 62
	i32 3419286801, ; 372: ChilkatDotNet46 => 0xcbce2d11 => 38
	i32 3428513518, ; 373: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 57
	i32 3430777524, ; 374: netstandard => 0xcc7d82b4 => 223
	i32 3463511458, ; 375: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3464190856, ; 376: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 42
	i32 3471940407, ; 377: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 143
	i32 3476120550, ; 378: Mono.Android => 0xcf3163e6 => 227
	i32 3479583265, ; 379: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 380: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 381: System.Text.Json.dll => 0xcfbaacae => 209
	i32 3500000672, ; 382: Microsoft.JSInterop => 0xd09dc5a0 => 79
	i32 3509114376, ; 383: System.Xml.Linq => 0xd128d608 => 217
	i32 3545306353, ; 384: Microsoft.Data.SqlClient => 0xd35114f1 => 48
	i32 3546531070, ; 385: BlazorBootstrap => 0xd363c4fe => 37
	i32 3561949811, ; 386: Azure.Core.dll => 0xd44f0a73 => 35
	i32 3570554715, ; 387: System.IO.FileSystem.AccessControl => 0xd4d2575b => 157
	i32 3570608287, ; 388: System.Runtime.Caching.dll => 0xd4d3289f => 96
	i32 3580758918, ; 389: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 390: System.Linq.dll => 0xd715a361 => 165
	i32 3624195450, ; 391: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 188
	i32 3641597786, ; 392: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 112
	i32 3643446276, ; 393: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 394: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 117
	i32 3657292374, ; 395: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 56
	i32 3660523487, ; 396: System.Net.NetworkInformation => 0xda2f27df => 170
	i32 3672681054, ; 397: Mono.Android.dll => 0xdae8aa5e => 227
	i32 3682565725, ; 398: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 102
	i32 3697841164, ; 399: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 400: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 73
	i32 3724971120, ; 401: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 116
	i32 3732100267, ; 402: System.Net.NameResolution => 0xde7354ab => 169
	i32 3732214720, ; 403: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 46
	i32 3737834244, ; 404: System.Net.Http.Json.dll => 0xdecad304 => 167
	i32 3748608112, ; 405: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 147
	i32 3786282454, ; 406: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 104
	i32 3792276235, ; 407: System.Collections.NonGeneric => 0xe2098b0b => 138
	i32 3802395368, ; 408: System.Collections.Specialized.dll => 0xe2a3f2e8 => 139
	i32 3807198597, ; 409: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 97
	i32 3823082795, ; 410: System.Security.Cryptography.dll => 0xe3df9d2b => 204
	i32 3837493441, ; 411: BlazorBootstrap.dll => 0xe4bb80c1 => 37
	i32 3841636137, ; 412: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 58
	i32 3849253459, ; 413: System.Runtime.InteropServices.dll => 0xe56ef253 => 189
	i32 3875112723, ; 414: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 201
	i32 3885497537, ; 415: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 177
	i32 3889960447, ; 416: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 417: System.Collections.Concurrent.dll => 0xe839deed => 136
	i32 3896760992, ; 418: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 106
	i32 3928044579, ; 419: System.Xml.ReaderWriter => 0xea213423 => 218
	i32 3931092270, ; 420: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 119
	i32 3953953790, ; 421: System.Text.Encoding.CodePages => 0xebac8bfe => 206
	i32 3955647286, ; 422: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 100
	i32 3962306622, ; 423: InstaFood.DataAccess => 0xec2c003e => 130
	i32 3980434154, ; 424: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 425: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 426: System.Diagnostics.Process.dll => 0xee9f991d => 148
	i32 4025784931, ; 427: System.Memory => 0xeff49a63 => 166
	i32 4046471985, ; 428: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 81
	i32 4051956670, ; 429: NuGet.Protocol.dll => 0xf183f3be => 91
	i32 4054681211, ; 430: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 184
	i32 4068434129, ; 431: System.Private.Xml.Linq.dll => 0xf27f60d1 => 182
	i32 4073602200, ; 432: System.Threading.dll => 0xf2ce3c98 => 215
	i32 4094352644, ; 433: Microsoft.Maui.Essentials.dll => 0xf40add04 => 83
	i32 4099507663, ; 434: System.Drawing.dll => 0xf45985cf => 153
	i32 4100113165, ; 435: System.Private.Uri => 0xf462c30d => 181
	i32 4101842092, ; 436: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 54
	i32 4102112229, ; 437: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 438: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 439: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 57
	i32 4127667938, ; 440: System.IO.FileSystem.Watcher => 0xf60736e2 => 158
	i32 4147896353, ; 441: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 184
	i32 4150914736, ; 442: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 443: System.Xml.XmlSerializer => 0xf7e95c85 => 220
	i32 4164802419, ; 444: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 158
	i32 4181436372, ; 445: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 194
	i32 4182413190, ; 446: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 114
	i32 4194278001, ; 447: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 52
	i32 4196529839, ; 448: System.Net.WebClient.dll => 0xfa21f6af => 176
	i32 4213026141, ; 449: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 147
	i32 4260525087, ; 450: System.Buffers => 0xfdf2741f => 135
	i32 4263231520, ; 451: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 94
	i32 4271975918, ; 452: Microsoft.Maui.Controls.dll => 0xfea12dee => 80
	i32 4274976490, ; 453: System.Runtime.Numerics => 0xfecef6ea => 191
	i32 4292120959, ; 454: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 114
	i32 4294648842 ; 455: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [456 x i32] [
	i32 170, ; 0
	i32 169, ; 1
	i32 132, ; 2
	i32 86, ; 3
	i32 213, ; 4
	i32 149, ; 5
	i32 33, ; 6
	i32 202, ; 7
	i32 84, ; 8
	i32 187, ; 9
	i32 60, ; 10
	i32 189, ; 11
	i32 211, ; 12
	i32 177, ; 13
	i32 202, ; 14
	i32 141, ; 15
	i32 104, ; 16
	i32 123, ; 17
	i32 30, ; 18
	i32 31, ; 19
	i32 144, ; 20
	i32 102, ; 21
	i32 59, ; 22
	i32 133, ; 23
	i32 163, ; 24
	i32 41, ; 25
	i32 185, ; 26
	i32 40, ; 27
	i32 2, ; 28
	i32 66, ; 29
	i32 30, ; 30
	i32 99, ; 31
	i32 85, ; 32
	i32 15, ; 33
	i32 111, ; 34
	i32 14, ; 35
	i32 161, ; 36
	i32 216, ; 37
	i32 174, ; 38
	i32 213, ; 39
	i32 166, ; 40
	i32 214, ; 41
	i32 34, ; 42
	i32 26, ; 43
	i32 140, ; 44
	i32 110, ; 45
	i32 203, ; 46
	i32 194, ; 47
	i32 222, ; 48
	i32 221, ; 49
	i32 73, ; 50
	i32 179, ; 51
	i32 13, ; 52
	i32 7, ; 53
	i32 70, ; 54
	i32 164, ; 55
	i32 67, ; 56
	i32 159, ; 57
	i32 195, ; 58
	i32 47, ; 59
	i32 87, ; 60
	i32 63, ; 61
	i32 200, ; 62
	i32 21, ; 63
	i32 199, ; 64
	i32 132, ; 65
	i32 108, ; 66
	i32 19, ; 67
	i32 208, ; 68
	i32 136, ; 69
	i32 173, ; 70
	i32 1, ; 71
	i32 217, ; 72
	i32 16, ; 73
	i32 97, ; 74
	i32 4, ; 75
	i32 190, ; 76
	i32 172, ; 77
	i32 161, ; 78
	i32 156, ; 79
	i32 25, ; 80
	i32 69, ; 81
	i32 45, ; 82
	i32 146, ; 83
	i32 181, ; 84
	i32 155, ; 85
	i32 167, ; 86
	i32 142, ; 87
	i32 160, ; 88
	i32 28, ; 89
	i32 90, ; 90
	i32 86, ; 91
	i32 127, ; 92
	i32 111, ; 93
	i32 151, ; 94
	i32 219, ; 95
	i32 180, ; 96
	i32 140, ; 97
	i32 159, ; 98
	i32 65, ; 99
	i32 121, ; 100
	i32 153, ; 101
	i32 58, ; 102
	i32 3, ; 103
	i32 100, ; 104
	i32 152, ; 105
	i32 131, ; 106
	i32 162, ; 107
	i32 60, ; 108
	i32 113, ; 109
	i32 72, ; 110
	i32 143, ; 111
	i32 128, ; 112
	i32 221, ; 113
	i32 16, ; 114
	i32 48, ; 115
	i32 50, ; 116
	i32 22, ; 117
	i32 61, ; 118
	i32 118, ; 119
	i32 50, ; 120
	i32 20, ; 121
	i32 54, ; 122
	i32 148, ; 123
	i32 18, ; 124
	i32 2, ; 125
	i32 109, ; 126
	i32 180, ; 127
	i32 165, ; 128
	i32 193, ; 129
	i32 32, ; 130
	i32 121, ; 131
	i32 105, ; 132
	i32 192, ; 133
	i32 187, ; 134
	i32 0, ; 135
	i32 127, ; 136
	i32 154, ; 137
	i32 62, ; 138
	i32 173, ; 139
	i32 94, ; 140
	i32 6, ; 141
	i32 137, ; 142
	i32 156, ; 143
	i32 101, ; 144
	i32 70, ; 145
	i32 137, ; 146
	i32 155, ; 147
	i32 134, ; 148
	i32 10, ; 149
	i32 74, ; 150
	i32 66, ; 151
	i32 5, ; 152
	i32 65, ; 153
	i32 210, ; 154
	i32 45, ; 155
	i32 25, ; 156
	i32 96, ; 157
	i32 92, ; 158
	i32 193, ; 159
	i32 36, ; 160
	i32 90, ; 161
	i32 176, ; 162
	i32 115, ; 163
	i32 125, ; 164
	i32 77, ; 165
	i32 107, ; 166
	i32 168, ; 167
	i32 210, ; 168
	i32 44, ; 169
	i32 196, ; 170
	i32 126, ; 171
	i32 171, ; 172
	i32 204, ; 173
	i32 49, ; 174
	i32 103, ; 175
	i32 23, ; 176
	i32 1, ; 177
	i32 216, ; 178
	i32 134, ; 179
	i32 43, ; 180
	i32 150, ; 181
	i32 123, ; 182
	i32 67, ; 183
	i32 226, ; 184
	i32 17, ; 185
	i32 110, ; 186
	i32 9, ; 187
	i32 71, ; 188
	i32 47, ; 189
	i32 131, ; 190
	i32 115, ; 191
	i32 128, ; 192
	i32 126, ; 193
	i32 119, ; 194
	i32 207, ; 195
	i32 192, ; 196
	i32 68, ; 197
	i32 88, ; 198
	i32 29, ; 199
	i32 26, ; 200
	i32 162, ; 201
	i32 186, ; 202
	i32 77, ; 203
	i32 8, ; 204
	i32 138, ; 205
	i32 182, ; 206
	i32 122, ; 207
	i32 55, ; 208
	i32 78, ; 209
	i32 5, ; 210
	i32 135, ; 211
	i32 113, ; 212
	i32 0, ; 213
	i32 72, ; 214
	i32 183, ; 215
	i32 112, ; 216
	i32 4, ; 217
	i32 150, ; 218
	i32 64, ; 219
	i32 196, ; 220
	i32 178, ; 221
	i32 145, ; 222
	i32 139, ; 223
	i32 220, ; 224
	i32 82, ; 225
	i32 12, ; 226
	i32 69, ; 227
	i32 68, ; 228
	i32 41, ; 229
	i32 179, ; 230
	i32 129, ; 231
	i32 168, ; 232
	i32 14, ; 233
	i32 49, ; 234
	i32 76, ; 235
	i32 197, ; 236
	i32 56, ; 237
	i32 8, ; 238
	i32 120, ; 239
	i32 175, ; 240
	i32 38, ; 241
	i32 18, ; 242
	i32 224, ; 243
	i32 188, ; 244
	i32 171, ; 245
	i32 218, ; 246
	i32 75, ; 247
	i32 55, ; 248
	i32 205, ; 249
	i32 13, ; 250
	i32 91, ; 251
	i32 40, ; 252
	i32 10, ; 253
	i32 145, ; 254
	i32 79, ; 255
	i32 175, ; 256
	i32 163, ; 257
	i32 223, ; 258
	i32 225, ; 259
	i32 80, ; 260
	i32 174, ; 261
	i32 39, ; 262
	i32 185, ; 263
	i32 11, ; 264
	i32 133, ; 265
	i32 208, ; 266
	i32 207, ; 267
	i32 42, ; 268
	i32 214, ; 269
	i32 61, ; 270
	i32 20, ; 271
	i32 89, ; 272
	i32 129, ; 273
	i32 183, ; 274
	i32 107, ; 275
	i32 15, ; 276
	i32 95, ; 277
	i32 51, ; 278
	i32 75, ; 279
	i32 35, ; 280
	i32 98, ; 281
	i32 87, ; 282
	i32 190, ; 283
	i32 219, ; 284
	i32 152, ; 285
	i32 146, ; 286
	i32 36, ; 287
	i32 195, ; 288
	i32 44, ; 289
	i32 198, ; 290
	i32 200, ; 291
	i32 191, ; 292
	i32 99, ; 293
	i32 211, ; 294
	i32 39, ; 295
	i32 101, ; 296
	i32 71, ; 297
	i32 21, ; 298
	i32 85, ; 299
	i32 52, ; 300
	i32 81, ; 301
	i32 82, ; 302
	i32 206, ; 303
	i32 124, ; 304
	i32 27, ; 305
	i32 84, ; 306
	i32 6, ; 307
	i32 105, ; 308
	i32 88, ; 309
	i32 19, ; 310
	i32 46, ; 311
	i32 51, ; 312
	i32 124, ; 313
	i32 83, ; 314
	i32 98, ; 315
	i32 43, ; 316
	i32 222, ; 317
	i32 224, ; 318
	i32 64, ; 319
	i32 125, ; 320
	i32 178, ; 321
	i32 149, ; 322
	i32 93, ; 323
	i32 89, ; 324
	i32 144, ; 325
	i32 205, ; 326
	i32 199, ; 327
	i32 109, ; 328
	i32 122, ; 329
	i32 93, ; 330
	i32 59, ; 331
	i32 95, ; 332
	i32 34, ; 333
	i32 116, ; 334
	i32 226, ; 335
	i32 142, ; 336
	i32 53, ; 337
	i32 12, ; 338
	i32 78, ; 339
	i32 203, ; 340
	i32 198, ; 341
	i32 154, ; 342
	i32 157, ; 343
	i32 212, ; 344
	i32 197, ; 345
	i32 151, ; 346
	i32 186, ; 347
	i32 160, ; 348
	i32 117, ; 349
	i32 53, ; 350
	i32 215, ; 351
	i32 92, ; 352
	i32 103, ; 353
	i32 164, ; 354
	i32 212, ; 355
	i32 141, ; 356
	i32 201, ; 357
	i32 130, ; 358
	i32 7, ; 359
	i32 74, ; 360
	i32 172, ; 361
	i32 108, ; 362
	i32 118, ; 363
	i32 24, ; 364
	i32 209, ; 365
	i32 106, ; 366
	i32 225, ; 367
	i32 76, ; 368
	i32 120, ; 369
	i32 3, ; 370
	i32 62, ; 371
	i32 38, ; 372
	i32 57, ; 373
	i32 223, ; 374
	i32 11, ; 375
	i32 42, ; 376
	i32 143, ; 377
	i32 227, ; 378
	i32 24, ; 379
	i32 23, ; 380
	i32 209, ; 381
	i32 79, ; 382
	i32 217, ; 383
	i32 48, ; 384
	i32 37, ; 385
	i32 35, ; 386
	i32 157, ; 387
	i32 96, ; 388
	i32 31, ; 389
	i32 165, ; 390
	i32 188, ; 391
	i32 112, ; 392
	i32 28, ; 393
	i32 117, ; 394
	i32 56, ; 395
	i32 170, ; 396
	i32 227, ; 397
	i32 102, ; 398
	i32 33, ; 399
	i32 73, ; 400
	i32 116, ; 401
	i32 169, ; 402
	i32 46, ; 403
	i32 167, ; 404
	i32 147, ; 405
	i32 104, ; 406
	i32 138, ; 407
	i32 139, ; 408
	i32 97, ; 409
	i32 204, ; 410
	i32 37, ; 411
	i32 58, ; 412
	i32 189, ; 413
	i32 201, ; 414
	i32 177, ; 415
	i32 32, ; 416
	i32 136, ; 417
	i32 106, ; 418
	i32 218, ; 419
	i32 119, ; 420
	i32 206, ; 421
	i32 100, ; 422
	i32 130, ; 423
	i32 27, ; 424
	i32 9, ; 425
	i32 148, ; 426
	i32 166, ; 427
	i32 81, ; 428
	i32 91, ; 429
	i32 184, ; 430
	i32 182, ; 431
	i32 215, ; 432
	i32 83, ; 433
	i32 153, ; 434
	i32 181, ; 435
	i32 54, ; 436
	i32 22, ; 437
	i32 17, ; 438
	i32 57, ; 439
	i32 158, ; 440
	i32 184, ; 441
	i32 29, ; 442
	i32 220, ; 443
	i32 158, ; 444
	i32 194, ; 445
	i32 114, ; 446
	i32 52, ; 447
	i32 176, ; 448
	i32 147, ; 449
	i32 135, ; 450
	i32 94, ; 451
	i32 80, ; 452
	i32 191, ; 453
	i32 114, ; 454
	i32 63 ; 455
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
