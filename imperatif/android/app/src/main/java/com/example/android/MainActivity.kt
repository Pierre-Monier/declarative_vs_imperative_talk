package com.example.android

import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import pl.droidsonroids.gif.GifDrawable
import pl.droidsonroids.gif.GifImageView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun onClick(v: View) {
        val gif = findViewById<GifImageView>(R.id.gif)
        val isGifAlreadyDisplay = gif.drawable != null

        updateLabel(isGifAlreadyDisplay)

        if (isGifAlreadyDisplay) {
            removeGif(gif)
        } else {
            loadImage(gif)
        }
    }

    private fun updateLabel(isGifAlreadyDisplay: Boolean) {
        val button = findViewById<Button>(R.id.button)

        if (isGifAlreadyDisplay) {
            button.text = "Click to show cool gif"
        } else {
            button.text = "Click to remove this cool gif"
        }
    }

    private fun removeGif(gif: GifImageView) {
        gif.setImageDrawable(null)
    }

    private fun loadImage(gif: GifImageView) {
        val gifFromAsset = GifDrawable(assets, "awesome.gif" )
        gif.setImageDrawable(gifFromAsset)
    }
}
