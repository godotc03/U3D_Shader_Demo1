Shader "Lessons/L0_0"
{
    Properties{
        _Color ("Main Color", Color) = (0,0,1,1)
    }
    
    SubShader
    {
        Pass
        {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"
                
                struct appdata
                {
                    float4 pos:POSITION;
                };
                
                struct v2f
                {
                    float4 vertex : SV_POSITION;
                };
                
                fixed4 _Color;
                
                v2f vert(appdata v)
                {
                    v2f o;
                    o.vertex = UnityObjectToClipPos(v.pos);
                    return o;
                }
                
                fixed4 frag(v2f I):SV_TARGET
                {
                    fixed4 col = _Color;
                    col.r = (sin(_Time.y)+1)/2;
                    return col;
                }
                
            ENDCG
        }
    }
    
}