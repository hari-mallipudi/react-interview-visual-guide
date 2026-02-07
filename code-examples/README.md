# Code Examples

This folder contains practical code examples for all React concepts covered in this repository.

## 📁 Folder Structure

```
code-examples/
├── hooks-examples/           # useState, useEffect, useContext, etc.
├── patterns-examples/        # HOC, Render Props, Composition
├── performance-examples/     # React.memo, Code splitting, Virtualization
└── state-management-examples/# Context, Redux, React Query
```

## 🚀 How to Use These Examples

### Option 1: Local Development (Recommended)

Each folder can be set up as a separate React project:

```bash
cd code-examples/hooks-examples
npx create-vite@latest . --template react
npm install
npm run dev
```

### Option 2: Online Sandbox

Copy examples to:
- **CodeSandbox:** https://codesandbox.io
- **StackBlitz:** https://stackblitz.com
- **CodePen:** https://codepen.io

### Option 3: Single Project with Multiple Examples

Create one project and organize examples as separate components:

```
my-react-examples/
├── src/
│   ├── hooks/
│   │   ├── UseStateExample.jsx
│   │   ├── UseEffectExample.jsx
│   │   └── ...
│   ├── patterns/
│   └── performance/
└── App.jsx (menu to navigate examples)
```

## 📝 Example Categories

### Hooks Examples (hooks-examples/)

**Beginner:**
- `01-useState-counter.jsx` - Basic counter
- `02-useState-form.jsx` - Form handling
- `03-useEffect-data-fetch.jsx` - API calls
- `04-useEffect-cleanup.jsx` - Cleanup function
- `05-useContext-theme.jsx` - Theme switcher

**Intermediate:**
- `06-useReducer-todo.jsx` - Todo list with reducer
- `07-useRef-dom.jsx` - DOM manipulation
- `08-useRef-previous-value.jsx` - Previous value tracking
- `09-useMemo-expensive.jsx` - Expensive calculation
- `10-useCallback-optimization.jsx` - Function memoization

**Advanced:**
- `11-custom-hook-localstorage.jsx` - useLocalStorage
- `12-custom-hook-fetch.jsx` - useFetch
- `13-useTransition-demo.jsx` - Concurrent features
- `14-useDeferredValue-search.jsx` - Deferred updates

### Patterns Examples (patterns-examples/)

- `01-hoc-with-loading.jsx` - Higher-Order Component
- `02-render-props-mouse.jsx` - Render Props pattern
- `03-compound-select.jsx` - Compound Components
- `04-provider-pattern.jsx` - Provider/Consumer
- `05-composition-layout.jsx` - Component Composition
- `06-container-presentational.jsx` - Smart/Dumb components

### Performance Examples (performance-examples/)

- `01-react-memo-demo.jsx` - React.memo usage
- `02-lazy-loading.jsx` - Code splitting with lazy
- `03-virtualized-list.jsx` - Long list virtualization
- `04-debounced-search.jsx` - Debouncing
- `05-optimized-forms.jsx` - Form optimization

### State Management Examples (state-management-examples/)

- `01-context-api.jsx` - Context API setup
- `02-redux-toolkit.jsx` - Redux Toolkit example
- `03-zustand-store.jsx` - Zustand store
- `04-react-query.jsx` - React Query data fetching

## 🎯 Example Naming Convention

```
[number]-[concept]-[variant].jsx

Examples:
- 01-useState-counter.jsx
- 02-useState-form.jsx
- 03-useEffect-data-fetch.jsx
```

## 💡 How to Create New Examples

### Template for Each Example:

```jsx
/**
 * [Concept Name] Example
 * 
 * What it demonstrates:
 * - Key concept 1
 * - Key concept 2
 * 
 * Interview tips:
 * - When to use this
 * - Common pitfalls
 */

import { useState } from 'react';

function ExampleComponent() {
  // Code here
  
  return (
    <div>
      {/* JSX here */}
    </div>
  );
}

export default ExampleComponent;

/**
 * Key Takeaways:
 * 1. 
 * 2. 
 * 3. 
 * 
 * Common Interview Questions:
 * Q: 
 * A: 
 */
```

## 📚 Learning Path

### Week 1-2: Hooks Examples
1. Start with `01-useState-counter.jsx`
2. Progress through useState variants
3. Move to useEffect examples
4. Try custom hooks

### Week 3: Patterns
1. Understand each pattern
2. Build small example for each
3. Compare with modern alternatives (hooks)

### Week 4: Performance
1. Learn measurement first (Profiler)
2. Try each optimization technique
3. Measure improvement

## 🔧 Setup Instructions

### Quick Setup (Vite - Recommended)

```bash
# In any example folder
npm create vite@latest . -- --template react
npm install
npm run dev
```

### With TypeScript

```bash
npm create vite@latest . -- --template react-ts
npm install
npm run dev
```

### Add Common Dependencies

```bash
# For state management examples
npm install zustand @reduxjs/toolkit react-redux @tanstack/react-query

# For performance examples  
npm install react-window

# For forms
npm install react-hook-form zod
```

## 🎨 Example Project Ideas

Build these to practice concepts:

### Beginner Projects:
1. **Counter App** - useState, useEffect
2. **Todo List** - useState, useReducer, localStorage
3. **Weather App** - useEffect, API calls
4. **Theme Switcher** - useContext

### Intermediate Projects:
5. **Blog Dashboard** - React Router, forms, CRUD
6. **Shopping Cart** - Context/Redux, calculations
7. **Infinite Scroll** - Intersection Observer, pagination
8. **Search with Debounce** - useTransition, performance

### Advanced Projects:
9. **Real-time Chat** - WebSockets, optimistic updates
10. **Admin Panel** - All concepts combined

## 📊 Checklist for Each Example

- [ ] Code is well-commented
- [ ] Includes error handling
- [ ] Has loading states
- [ ] Follows best practices
- [ ] Interview notes included
- [ ] Works without warnings
- [ ] Explains "why" not just "how"

## 🐛 Debugging Tips

### Common Issues:

**Issue:** Component not re-rendering
**Solution:** Check if you're mutating state directly (don't!)

**Issue:** Infinite loop in useEffect
**Solution:** Check dependency array

**Issue:** Stale closure
**Solution:** Add all dependencies to useEffect/useCallback

**Issue:** Warning about keys
**Solution:** Use unique, stable IDs as keys

## 📖 Additional Resources

- **Official React Docs:** https://react.dev
- **React Patterns:** https://reactpatterns.com
- **useHooks:** https://usehooks.com

## 🎯 Practice Routine

### Daily (30 min):
1. Pick one example
2. Read the code
3. Understand the concept
4. Build similar example from memory
5. Explain out loud

### Weekly (2 hours):
1. Build a mini-project combining 3-5 concepts
2. Refactor for best practices
3. Add comments explaining decisions

## ✅ Quality Standards

Each example should:
- Solve a real problem
- Be production-ready (error handling, loading states)
- Follow React best practices
- Include interview insights
- Be copy-paste ready for projects

---

**Start coding! The best way to learn is by building! 🚀**
