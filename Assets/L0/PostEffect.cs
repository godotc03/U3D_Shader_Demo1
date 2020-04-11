using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostEffect : MonoBehaviour
{
    public Material mat;
    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        //Graphics.Blit(src, dest);

        //1280*720
        //Color[] pixels = new Color[1280 * 720];
        //for (int x = 0; x < 1280; x++)
        //{
        //    for (int y = 0; y < 720; y++)
        //    {
        //        //pixels[x + 1280 * y].r = 1.2f * 0.7f; //Mathf.Sin(0.7f); Mathf.Pow(1.2f, 3);
        //    }
        //}

        //Texture2D outputTex = new Texture2D(512, 512, TextureFormat.RGBA32, false);
        //outputTex.SetPixels(pixels);
        //outputTex.Apply();
        //mat.SetTexture(1,outputTex);
        Graphics.Blit(src, dest, mat);
    }
}
