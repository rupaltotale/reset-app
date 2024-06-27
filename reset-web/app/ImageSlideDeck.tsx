"use client";
import Image from "next/image";
import { useState } from "react";
import { IoIosArrowBack, IoIosArrowForward } from "react-icons/io";

const ImageSlideDeck = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const images = [
    { src: "/previews/1.png", alt: "First Image" },
    { src: "/previews/2.png", alt: "Second Image" },
    { src: "/previews/3.png", alt: "Third Image" },
    // Add more images as needed
  ];

  const goToNext = () => {
    setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
  };

  const goToPrevious = () => {
    setCurrentIndex(
      (prevIndex) => (prevIndex - 1 + images.length) % images.length
    );
  };

  return (
    <div>
      <Image
        src={images[currentIndex].src}
        alt={images[currentIndex].alt}
        objectFit="contain"
        width={300}
        height={500}
        className="rounded-2xl"
      />
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          width: "100%",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            width: "100%",
          }}
        >
          <button onClick={goToPrevious}>
            <IoIosArrowBack />
          </button>
          <button onClick={goToNext}>
            <IoIosArrowForward />
          </button>
        </div>
      </div>
    </div>
  );
};

export default ImageSlideDeck;
