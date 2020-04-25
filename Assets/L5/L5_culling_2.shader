Shader "Unlit/L5_culling_2"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Pass
        {
			Blend SrcAlpha OneMinusSrcAlpha
			Lighting On
			Cull Off	//Front Back Off
			SetTexture[_MainTex] { combine texture }
        }
    }
}
