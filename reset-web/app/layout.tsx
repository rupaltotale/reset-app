import type { Metadata } from "next";
import { Inter } from "next/font/google";
import Head from "next/head";
import Image from "next/image";
import Link from "next/link";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Reset",
  description: "Start new everyday",
  icons: "/logo.png",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <>
      <Head>
        <link rel="icon" type="image/png" href="/logo.png" />
      </Head>
      <html lang="en">
        <body className={inter.className}>
          <header className="px-4 lg:px-6 h-14 flex items-center">
            <Link
              href="/"
              className="flex items-center justify-center"
              prefetch={false}
            >
              <Image
                src="/logo.png"
                alt="App Icon"
                objectFit="contain"
                width={30}
                height={50}
                className="rounded mr-2"
              />
              <span className="">Reset</span>
            </Link>
          </header>
          {children}

          <footer className="flex flex-col gap-2 sm:flex-row py-6 w-full shrink-0 items-center px-4 md:px-6 border-t">
            <p className="text-xs text-gray-500 dark:text-gray-400">
              &copy; 2024 Rupal Totale. All rights reserved.
            </p>
            <nav className="sm:ml-auto flex gap-4 sm:gap-6">
              <Link
                href="/terms-of-use"
                className="text-xs hover:underline underline-offset-4"
                prefetch={false}
              >
                Terms of Service
              </Link>
              <Link
                href="/privacy-policy"
                className="text-xs hover:underline underline-offset-4"
                prefetch={false}
              >
                Privacy
              </Link>
              <Link
                href="/contact-us"
                className="text-xs hover:underline underline-offset-4"
                prefetch={false}
              >
                Contact Us
              </Link>
            </nav>
          </footer>
        </body>
      </html>
    </>
  );
}
