
Shader "Lessons/L0_1"
{
    Properties{
        _Color ("Main Color", Color) = (0,0,1,1)
    }
    SubShader{
        Pass{
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"
                
                struct appdata
                {
                    float4 vertex : POSITION;
                };
                struct v2f
                {
                    float4 vertex : SV_POSITION;
                };
                
                fixed4 _Color;
                
                v2f vert(appdata v)
                {
                    v2f o;
                    o.vertex = UnityObjectToClipPos(v.vertex);
                    return o;
                }
            
                fixed4 frag(v2f I) :SV_TARGET
                {
                    fixed4 col = _Color;
                    return col;
                }
                
            ENDCG
        }
    }
}