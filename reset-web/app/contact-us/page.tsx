"use client";
/**
 * v0 by Vercel.
 * @see https://v0.dev/t/7AnHKqZpVGE
 * Documentation: https://v0.dev/docs#integrating-generated-code-into-your-nextjs-app
 */
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { useState } from "react";

export default function Component() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    // Send form data to the API endpoint
    try {
      const response = await fetch(
        "https://api.form-data.com/f/exost8nbg3sztfi1ntvujf",
        {
          method: "POST",
          body: JSON.stringify(formData),
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
      if (response.ok) {
        alert("Form submitted successfully");
      } else {
        console.error(response);
        throw new Error("Form submission failed");
      }
    } catch (error) {
      console.error(error);
      alert("Form submission failed");
    }
  };

  return (
    <div className="container mx-auto px-4 py-12 md:py-20 lg:py-24">
      <div className="grid grid-cols-1 gap-12 md:grid-cols-2 lg:gap-24">
        <div className="space-y-6">
          <div>
            <h1 className="text-3xl font-bold tracking-tight sm:text-4xl">
              Get in touch
            </h1>
            <p className="mt-3 text-lg text-gray-500 dark:text-gray-400">
              Have a question or need help? Fill out the form and we'll get back
              to you as soon as possible.
            </p>
          </div>
          <form className="space-y-6" onSubmit={handleSubmit}>
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="name">Name</Label>
                <Input
                  id="name"
                  name="name"
                  value={formData.name}
                  onChange={handleChange}
                  placeholder="Enter your name"
                />
              </div>
              <div>
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  name="email"
                  value={formData.email}
                  onChange={handleChange}
                  type="email"
                  placeholder="Enter your email"
                />
              </div>
            </div>
            <div>
              <Label htmlFor="message">Message</Label>
              <Textarea
                id="message"
                name="message"
                value={formData.message}
                onChange={handleChange}
                placeholder="Enter your message"
                className="min-h-[150px]"
              />
            </div>
            <Button type="submit">Submit</Button>
          </form>
        </div>
        <div className="space-y-6">
          <div>
            <h2 className="text-2xl font-bold tracking-tight">
              Contact Information
            </h2>
            <p className="mt-3 text-lg text-gray-500 dark:text-gray-400">
              Get in touch with us for any questions or inquiries.
            </p>
          </div>
          <div className="space-y-4">
            <div>
              <h3 className="text-lg font-medium">Email</h3>
              <a
                href="mailto:pocket_chef@outlook.com"
                className="text-blue-600"
              >
                pocket_chef@outlook.com
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
