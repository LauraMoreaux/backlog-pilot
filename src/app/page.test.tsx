import { render, screen } from "@testing-library/react";
import Home from "./page";

describe("Home page", () => {
  it("shows the app name as the main heading", () => {
    render(<Home />);

    expect(
      screen.getByRole("heading", { level: 1, name: "Backlog Pilot" }),
    ).toBeInTheDocument();
  });

  it("shows a short description of the app", () => {
    render(<Home />);

    expect(screen.getByRole("main")).toHaveTextContent(
      /AI-assisted backlog board/i,
    );
  });
});
